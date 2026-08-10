resource "aws_s3_bucket" "artifacts" {
  bucket_prefix = "${var.name}-pipeline-"
  force_destroy = false
}

resource "aws_s3_bucket_versioning" "artifacts" {
  bucket = aws_s3_bucket.artifacts.id
  versioning_configuration { status = "Enabled" }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "artifacts" {
  bucket = aws_s3_bucket.artifacts.id
  rule {
    apply_server_side_encryption_by_default { sse_algorithm = "AES256" }
  }
}

resource "aws_s3_bucket_public_access_block" "artifacts" {
  bucket                  = aws_s3_bucket.artifacts.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

data "aws_iam_policy_document" "codebuild_assume_role" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["codebuild.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "codebuild" {
  name               = "${var.name}-codebuild-role"
  assume_role_policy = data.aws_iam_policy_document.codebuild_assume_role.json
}

data "aws_iam_policy_document" "codebuild" {
  statement {
    actions   = ["logs:CreateLogGroup", "logs:CreateLogStream", "logs:PutLogEvents"]
    resources = ["*"]
  }
  statement {
    actions   = ["s3:GetObject", "s3:GetObjectVersion", "s3:PutObject"]
    resources = ["${aws_s3_bucket.artifacts.arn}/*", "arn:aws:s3:::${var.terraform_state_bucket}/*"]
  }
  statement {
    actions   = ["s3:ListBucket", "s3:GetBucketVersioning"]
    resources = [aws_s3_bucket.artifacts.arn, "arn:aws:s3:::${var.terraform_state_bucket}"]
  }
  statement {
    actions   = ["s3:CreateBucket", "s3:DeleteBucket", "s3:PutBucketTagging", "s3:PutBucketVersioning", "s3:PutEncryptionConfiguration", "s3:PutBucketPublicAccessBlock", "s3:GetEncryptionConfiguration", "s3:GetBucketPublicAccessBlock", "s3:GetBucketTagging"]
    resources = ["*"]
  }
  statement {
    actions   = ["dynamodb:DescribeTable", "dynamodb:GetItem", "dynamodb:PutItem", "dynamodb:DeleteItem"]
    resources = ["arn:aws:dynamodb:${var.aws_region}:${data.aws_caller_identity.current.account_id}:table/${var.terraform_lock_table}"]
  }
  statement {
    # The deployment role is intentionally project-scoped by isolation, not by API action.
    actions   = ["ec2:*", "eks:*", "iam:*", "codebuild:*", "codepipeline:*", "codestar-connections:UseConnection"]
    resources = ["*"]
  }
}

data "aws_caller_identity" "current" {}

resource "aws_iam_role_policy" "codebuild" {
  role   = aws_iam_role.codebuild.id
  policy = data.aws_iam_policy_document.codebuild.json
}

resource "aws_codebuild_project" "plan" {
  name         = "${var.name}-plan"
  service_role = aws_iam_role.codebuild.arn

  artifacts { type = "CODEPIPELINE" }
  environment {
    compute_type = "BUILD_GENERAL1_SMALL"
    image        = "hashicorp/terraform:1.9"
    type         = "LINUX_CONTAINER"

    environment_variable {
      name  = "TF_STATE_BUCKET"
      value = var.terraform_state_bucket
    }
    environment_variable {
      name  = "TF_STATE_KEY"
      value = var.terraform_state_key
    }
    environment_variable {
      name  = "TF_LOCK_TABLE"
      value = var.terraform_lock_table
    }
    dynamic "environment_variable" {
      for_each = local.pipeline_tf_vars
      content {
        name  = "TF_VAR_${environment_variable.key}"
        value = jsonencode(environment_variable.value)
      }
    }
  }
  source {
    type      = "CODEPIPELINE"
    buildspec = "projects/aws-terraform-eks-codepipeline/pipeline/buildspec-plan.yml"
  }
}

resource "aws_codebuild_project" "apply" {
  name         = "${var.name}-apply"
  service_role = aws_iam_role.codebuild.arn

  artifacts { type = "CODEPIPELINE" }
  environment {
    compute_type = "BUILD_GENERAL1_SMALL"
    image        = "hashicorp/terraform:1.9"
    type         = "LINUX_CONTAINER"

    environment_variable {
      name  = "TF_STATE_BUCKET"
      value = var.terraform_state_bucket
    }
    environment_variable {
      name  = "TF_STATE_KEY"
      value = var.terraform_state_key
    }
    environment_variable {
      name  = "TF_LOCK_TABLE"
      value = var.terraform_lock_table
    }
    dynamic "environment_variable" {
      for_each = local.pipeline_tf_vars
      content {
        name  = "TF_VAR_${environment_variable.key}"
        value = jsonencode(environment_variable.value)
      }
    }
  }
  source {
    type      = "CODEPIPELINE"
    buildspec = "pipeline/buildspec-apply.yml"
  }
}

data "aws_iam_policy_document" "pipeline_assume_role" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["codepipeline.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "pipeline" {
  name               = "${var.name}-pipeline-role"
  assume_role_policy = data.aws_iam_policy_document.pipeline_assume_role.json
}

data "aws_iam_policy_document" "pipeline" {
  statement {
    actions   = ["s3:GetObject", "s3:GetObjectVersion", "s3:PutObject", "s3:GetBucketVersioning"]
    resources = [aws_s3_bucket.artifacts.arn, "${aws_s3_bucket.artifacts.arn}/*"]
  }
  statement {
    actions   = ["codebuild:StartBuild", "codebuild:BatchGetBuilds"]
    resources = [aws_codebuild_project.plan.arn, aws_codebuild_project.apply.arn]
  }
  statement {
    actions   = ["codestar-connections:UseConnection"]
    resources = [var.codestar_connection_arn]
  }
}

resource "aws_iam_role_policy" "pipeline" {
  role   = aws_iam_role.pipeline.id
  policy = data.aws_iam_policy_document.pipeline.json
}

resource "aws_codepipeline" "this" {
  name     = "${var.name}-terraform"
  role_arn = aws_iam_role.pipeline.arn

  artifact_store {
    location = aws_s3_bucket.artifacts.bucket
    type     = "S3"
  }

  stage {
    name = "Source"
    action {
      name             = "Source"
      category         = "Source"
      owner            = "AWS"
      provider         = "CodeStarSourceConnection"
      version          = "1"
      output_artifacts = ["SourceOutput"]
      configuration = {
        ConnectionArn    = var.codestar_connection_arn
        FullRepositoryId = var.repository_id
        BranchName       = var.repository_branch
      }
    }
  }

  stage {
    name = "Plan"
    action {
      name             = "TerraformPlan"
      category         = "Build"
      owner            = "AWS"
      provider         = "CodeBuild"
      version          = "1"
      input_artifacts  = ["SourceOutput"]
      output_artifacts = ["PlanOutput"]
      configuration    = { ProjectName = aws_codebuild_project.plan.name }
    }
  }

  stage {
    name = "Approval"
    action {
      name     = "ApprovePlan"
      category = "Approval"
      owner    = "AWS"
      provider = "Manual"
      version  = "1"
      configuration = {
        CustomData = "Review the Terraform plan in the CodeBuild logs before approving."
      }
    }
  }

  stage {
    name = "Apply"
    action {
      name            = "TerraformApply"
      category        = "Build"
      owner           = "AWS"
      provider        = "CodeBuild"
      version         = "1"
      input_artifacts = ["PlanOutput"]
      configuration   = { ProjectName = aws_codebuild_project.apply.name }
    }
  }
}

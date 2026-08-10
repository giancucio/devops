locals {
  tags = merge(var.tags, {
    Environment = var.environment
    ManagedBy   = "Terraform"
    Project     = var.name
  })

  pipeline_tf_vars = {
    aws_region              = var.aws_region
    name                    = var.name
    environment             = var.environment
    vpc_cidr                = var.vpc_cidr
    kubernetes_version      = var.kubernetes_version
    node_instance_types     = var.node_instance_types
    node_desired_size       = var.node_desired_size
    node_min_size           = var.node_min_size
    node_max_size           = var.node_max_size
    repository_id           = var.repository_id
    repository_branch       = var.repository_branch
    codestar_connection_arn = var.codestar_connection_arn
    terraform_state_bucket  = var.terraform_state_bucket
    terraform_state_key     = var.terraform_state_key
    terraform_lock_table    = var.terraform_lock_table
    tags                    = var.tags
  }
}

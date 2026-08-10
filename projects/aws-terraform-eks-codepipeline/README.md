# AWS EKS with CodePipeline

This Terraform project creates a production-shaped EKS foundation with two public and two private subnets across availability zones, one NAT gateway per zone, an EKS managed node group, and a CodePipeline deployment pipeline.

The pipeline flow is **GitHub source → Terraform plan → manual approval → apply saved plan**. The source action uses AWS CodeStar Connections, so no GitHub token is stored in Terraform.

## Structure

- `terraform/` contains the AWS infrastructure and CodePipeline Terraform configuration.
- `pipeline/` contains the CodeBuild plan and apply build specifications.

## Prerequisites

- Terraform 1.6 or newer and AWS credentials with permission to create the resources
- An existing encrypted, versioned S3 bucket for Terraform state
- An existing DynamoDB table with a string partition key named `LockID`
- An AWS CodeStar Connections connection to GitHub in `AVAILABLE` status

The backend must exist before this stack because Terraform cannot safely create its own backend. The first deployment bootstraps the pipeline; subsequent commits are deployed by CodePipeline.

## Deploy

Copy `terraform/terraform.tfvars.example` to `terraform/terraform.tfvars`, replace the placeholder values, then run:

```powershell
Set-Location terraform
terraform init `
  -backend-config="bucket=YOUR_STATE_BUCKET" `
  -backend-config="key=projects/aws-terraform-eks-codepipeline/terraform.tfstate" `
  -backend-config="region=ap-southeast-1" `
  -backend-config="dynamodb_table=YOUR_LOCK_TABLE" `
  -backend-config="encrypt=true"
terraform plan -out=tfplan
terraform apply tfplan
```

Terraform configures these non-secret backend coordinates as environment variables on both CodeBuild projects:

- `TF_STATE_BUCKET`: the state bucket name
- `TF_STATE_KEY`: the state object key
- `TF_LOCK_TABLE`: the DynamoDB lock table name

The stack runs two NAT gateways and an EKS control plane, which incur charges. Destroy it when it is not needed:

```powershell
terraform destroy
```

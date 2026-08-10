variable "aws_region" {
  description = "AWS Region in which to deploy the project."
  type        = string
  default     = "ap-southeast-1"
}

variable "name" {
  description = "Name prefix for project resources."
  type        = string
  default     = "portfolio-eks"
}

variable "environment" {
  description = "Deployment environment name."
  type        = string
  default     = "dev"
}

variable "vpc_cidr" {
  description = "CIDR range for the VPC."
  type        = string
  default     = "10.40.0.0/16"
}

variable "kubernetes_version" {
  description = "EKS Kubernetes version. Null lets EKS select its current default."
  type        = string
  default     = null
}

variable "node_instance_types" {
  description = "EC2 instance types used by the managed node group."
  type        = list(string)
  default     = ["t3.medium"]
}

variable "node_desired_size" {
  type    = number
  default = 2
}

variable "node_min_size" {
  type    = number
  default = 2
}

variable "node_max_size" {
  type    = number
  default = 4
}

variable "repository_id" {
  description = "GitHub repository in owner/repository format."
  type        = string
}

variable "repository_branch" {
  description = "Git branch watched by CodePipeline."
  type        = string
  default     = "main"
}

variable "codestar_connection_arn" {
  description = "ARN of an ACTIVE AWS CodeStar Connections GitHub connection."
  type        = string
}

variable "terraform_state_bucket" {
  description = "Existing versioned and encrypted S3 bucket for Terraform state."
  type        = string
}

variable "terraform_state_key" {
  description = "S3 object key for Terraform state."
  type        = string
  default     = "projects/aws-terraform-eks-codepipeline/terraform.tfstate"
}

variable "terraform_lock_table" {
  description = "Existing DynamoDB table used for Terraform state locking."
  type        = string
}

variable "tags" {
  description = "Additional tags to apply to resources."
  type        = map(string)
  default     = {}
}

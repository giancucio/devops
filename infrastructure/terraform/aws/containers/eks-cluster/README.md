# AWS Eks Cluster

Path: `infrastructure/terraform/aws/containers/eks-cluster`

## Purpose

Reusable AWS Terraform module/example for **Eks Cluster**.

## Files

- `main.tf`
- `variables.tf`
- `outputs.tf`
- `versions.tf`

## Usage

```hcl
module "eks_cluster" {
  source = "./infrastructure/terraform/aws/containers/eks-cluster"
}
```

## Notes

Keep values generic and safe for public portfolio use.

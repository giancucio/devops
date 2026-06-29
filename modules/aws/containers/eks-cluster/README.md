# AWS Eks Cluster

Path: `modules/aws/containers/eks-cluster`

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
  source = "./modules/aws/containers/eks-cluster"
}
```

## Notes

Keep values generic and safe for public portfolio use.

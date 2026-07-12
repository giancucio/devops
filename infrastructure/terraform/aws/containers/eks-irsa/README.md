# AWS Eks Irsa

Path: `infrastructure/terraform/aws/containers/eks-irsa`

## Purpose

Reusable AWS Terraform module/example for **Eks Irsa**.

## Files

- `main.tf`
- `variables.tf`
- `outputs.tf`
- `versions.tf`

## Usage

```hcl
module "eks_irsa" {
  source = "./infrastructure/terraform/aws/containers/eks-irsa"
}
```

## Notes

Keep values generic and safe for public portfolio use.

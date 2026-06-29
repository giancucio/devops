# AWS Eks Node Group

Path: `modules/aws/containers/eks-node-group`

## Purpose

Reusable AWS Terraform module/example for **Eks Node Group**.

## Files

- `main.tf`
- `variables.tf`
- `outputs.tf`
- `versions.tf`

## Usage

```hcl
module "eks_node_group" {
  source = "./modules/aws/containers/eks-node-group"
}
```

## Notes

Keep values generic and safe for public portfolio use.

# AWS Helm Release

Path: `modules/aws/containers/helm-release`

## Purpose

Reusable AWS Terraform module/example for **Helm Release**.

## Files

- `main.tf`
- `variables.tf`
- `outputs.tf`
- `versions.tf`

## Usage

```hcl
module "helm_release" {
  source = "./modules/aws/containers/helm-release"
}
```

## Notes

Keep values generic and safe for public portfolio use.

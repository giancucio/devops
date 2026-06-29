# Terraform Module Template

This template demonstrates a minimal Terraform module layout.

Files:
- `main.tf` - primary resources
- `variables.tf` - module inputs
- `outputs.tf` - module outputs
- `versions.tf` - required provider versions

Usage:

```
module "example" {
  source = "../.."
  name = "example"
}
```

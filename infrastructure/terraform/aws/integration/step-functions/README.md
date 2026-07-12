# AWS Step Functions

Path: `infrastructure/terraform/aws/integration/step-functions`

## Purpose

Reusable AWS Terraform module/example for **Step Functions**.

## Files

- `main.tf`
- `variables.tf`
- `outputs.tf`
- `versions.tf`

## Usage

```hcl
module "step_functions" {
  source = "./infrastructure/terraform/aws/integration/step-functions"
}
```

## Notes

Keep values generic and safe for public portfolio use.

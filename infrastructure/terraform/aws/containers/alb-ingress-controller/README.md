# AWS Alb Ingress Controller

Path: `infrastructure/terraform/aws/containers/alb-ingress-controller`

## Purpose

Reusable AWS Terraform module/example for **Alb Ingress Controller**.

## Files

- `main.tf`
- `variables.tf`
- `outputs.tf`
- `versions.tf`

## Usage

```hcl
module "alb_ingress_controller" {
  source = "./infrastructure/terraform/aws/containers/alb-ingress-controller"
}
```

## Notes

Keep values generic and safe for public portfolio use.

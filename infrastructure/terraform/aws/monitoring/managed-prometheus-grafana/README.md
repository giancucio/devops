# AWS Managed Prometheus Grafana

Path: `infrastructure/terraform/aws/monitoring/managed-prometheus-grafana`

## Purpose

Reusable AWS Terraform module/example for **Managed Prometheus Grafana**.

## Files

- `main.tf`
- `variables.tf`
- `outputs.tf`
- `versions.tf`

## Usage

```hcl
module "managed_prometheus_grafana" {
  source = "./infrastructure/terraform/aws/monitoring/managed-prometheus-grafana"
}
```

## Notes

Keep values generic and safe for public portfolio use.

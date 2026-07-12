# AWS Kinesis Firehose

Path: `infrastructure/terraform/aws/analytics/kinesis-firehose`

## Purpose

Reusable AWS Terraform module/example for **Kinesis Firehose**.

## Files

- `main.tf`
- `variables.tf`
- `outputs.tf`
- `versions.tf`

## Usage

```hcl
module "kinesis_firehose" {
  source = "./infrastructure/terraform/aws/analytics/kinesis-firehose"
}
```

## Notes

Keep values generic and safe for public portfolio use.

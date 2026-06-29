# AWS Kinesis Firehose

Path: `modules/aws/analytics/kinesis-firehose`

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
  source = "./modules/aws/analytics/kinesis-firehose"
}
```

## Notes

Keep values generic and safe for public portfolio use.

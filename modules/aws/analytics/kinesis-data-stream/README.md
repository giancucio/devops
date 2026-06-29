# AWS Kinesis Data Stream

Path: `modules/aws/analytics/kinesis-data-stream`

## Purpose

Reusable AWS Terraform module/example for **Kinesis Data Stream**.

## Files

- `main.tf`
- `variables.tf`
- `outputs.tf`
- `versions.tf`

## Usage

```hcl
module "kinesis_data_stream" {
  source = "./modules/aws/analytics/kinesis-data-stream"
}
```

## Notes

Keep values generic and safe for public portfolio use.

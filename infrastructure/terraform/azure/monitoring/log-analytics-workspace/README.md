# monitoring/log-analytics-workspace

This Terraform module was generated as a skeleton from the corresponding Bicep module.

## Variables

- `workspaceName` (string) (default: laworkspace-portfolio)
- `location` (string) (default: eastus)

## Outputs

- `workspaceId` (string)

## Example

```hcl
module "monitoring_log-analytics-workspace" {
  source = "../../../../infrastructure/terraform/azure/monitoring/log-analytics-workspace"
  # set variables here
}
```

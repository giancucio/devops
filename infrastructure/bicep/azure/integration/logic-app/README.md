# Logic App Workflow

Deploys an Azure Logic Apps workflow.

## Module

This directory contains a reusable Azure Bicep module.

## Parameters

- `workflowName` (string) - Logic App workflow name (default: logicapp-portfolio)
- `location` (string) - Azure location (default: eastus)

## Outputs

- `workflowId` (string)

## Example

```bicep
module logicapp './main.bicep' = {
  name: 'logic-app-deploy'
  params: {
    workflowName: 'logicapp-portfolio'
    location: 'eastus'
  }
}
```

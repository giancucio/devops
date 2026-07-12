# Policy Assignment

Assigns a policy definition to a scope to enforce governance.

## Module

This directory contains a reusable Azure Bicep module.

## Parameters

- `assignmentName` (string) - Policy assignment name (default: policyAssignment)
- `policyDefinitionId` (string) - Policy definition resource ID (default: /subscriptions/.../providers/Microsoft.Authorization/policyDefinitions/...)
- `scope` (string) - Assignment scope (default: /subscriptions/<subscriptionId>)

## Outputs

- `assignmentId` (string)

## Example

```bicep
module policyassignment './main.bicep' = {
  name: 'policy-assignment-deploy'
  params: {
    assignmentName: 'policyAssignment'
    policyDefinitionId: '/subscriptions/.../providers/Microsoft.Authorization/policyDefinitions/...'
    scope: '/subscriptions/<subscriptionId>'
  }
}
```

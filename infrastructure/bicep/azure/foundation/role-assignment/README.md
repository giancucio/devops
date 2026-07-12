# Role Assignment

Creates an Azure RBAC role assignment for a principal.

## Module

This directory contains a reusable Azure Bicep module.

## Parameters

- `principalId` (string) - Principal object ID (default: 00000000-0000-0000-0000-000000000000)
- `roleDefinitionId` (string) - Role definition resource ID (default: /subscriptions/.../providers/Microsoft.Authorization/roleDefinitions/...)
- `scope` (string) - Assignment scope (default: /subscriptions/<subscriptionId>)

## Outputs

- `roleAssignmentId` (string)

## Example

```bicep
module roleassignment './main.bicep' = {
  name: 'role-assignment-deploy'
  params: {
    principalId: '00000000-0000-0000-0000-000000000000'
    roleDefinitionId: '/subscriptions/.../providers/Microsoft.Authorization/roleDefinitions/...'
    scope: '/subscriptions/<subscriptionId>'
  }
}
```

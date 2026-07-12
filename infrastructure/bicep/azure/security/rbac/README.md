# Role Definition

Deploys a custom RBAC role definition.

## Module

This directory contains a reusable Azure Bicep module.

## Parameters

- `roleName` (string) - Role definition name (default: CustomRole)
- `description` (string) - Role definition description (default: Custom role definition)
- `permissions` (array) - Action permissions (default: [{'actions': ['*'], 'notActions': []}])
- `assignableScopes` (array) - Assignable scopes (default: ['/subscriptions/<subscriptionId>'])

## Outputs

- `roleDefinitionId` (string)

## Example

```bicep
module rbac './main.bicep' = {
  name: 'rbac-deploy'
  params: {
    roleName: 'CustomRole'
    description: 'Custom role definition'
    permissions: [{ actions: ['*'], notActions: [] }]
    assignableScopes: ['/subscriptions/<subscriptionId>']
  }
}
```

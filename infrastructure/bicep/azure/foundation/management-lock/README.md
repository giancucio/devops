# Management Lock

Applies a management lock to protect resources from accidental deletion or updates.

## Module

This directory contains a reusable Azure Bicep module.

## Parameters

- `lockName` (string) - Lock name (default: readOnlyLock)
- `lockLevel` (string) - Lock level (default: CanNotDelete)
- `notes` (string) - Lock notes (default: Protect resource)

## Outputs

- `lockId` (string)

## Example

```bicep
module managementlock './main.bicep' = {
  name: 'management-lock-deploy'
  params: {
    lockName: 'readOnlyLock'
    lockLevel: 'CanNotDelete'
    notes: 'Protect resource'
  }
}
```

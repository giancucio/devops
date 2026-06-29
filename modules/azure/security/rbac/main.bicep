targetScope = 'resourceGroup'

@description('Principal object ID, such as managed identity principal ID.')
param principalId string

@description('Built-in or custom role definition ID.')
param roleDefinitionId string

@description('Scope where the role assignment is applied. Defaults to current resource group.')
param targetScope string = resourceGroup().id

resource roleAssignment 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  name: guid(targetScope, principalId, roleDefinitionId)
  scope: resourceGroup()
  properties: {
    principalId: principalId
    roleDefinitionId: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', roleDefinitionId)
    principalType: 'ServicePrincipal'
  }
}

output roleAssignmentId string = roleAssignment.id

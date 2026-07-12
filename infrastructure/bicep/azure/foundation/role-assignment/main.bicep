param location string = 'eastus'
param principalId string = '00000000-0000-0000-0000-000000000000'
param roleDefinitionId string = '/subscriptions/.../providers/Microsoft.Authorization/roleDefinitions/...'
param scope string = '/subscriptions/<subscriptionId>'

resource resourceModule 'Microsoft.Authorization/roleAssignments@2022-04-01-preview' = {
  name: guid(resourceGroup().id, principalId, roleDefinitionId)
  location: location
}

output roleAssignmentId string = resourceModule.id

param location string = 'eastus'
param roleName string = 'CustomRole'
param description string = 'Custom role definition'
param permissions array = [{ actions: ['*'], notActions: [] }]
param assignableScopes array = ['/subscriptions/<subscriptionId>']

resource resourceModule 'Microsoft.Authorization/roleDefinitions@2022-04-01-preview' = {
  name: guid(subscription().id, roleName)
  location: location
}

output roleDefinitionId string = resourceModule.id

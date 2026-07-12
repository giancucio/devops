param location string = 'eastus'
param resourceId string = '/subscriptions/.../resourceGroups/.../providers/Microsoft.KeyVault/vaults/...'
param workspaceId string = '/subscriptions/.../resourceGroups/.../providers/Microsoft.OperationalInsights/workspaces/...'

resource resourceModule 'Microsoft.Insights/diagnosticSettings@2021-05-01-preview' = {
  name: '${resourceId}/diagnosticSettings'
  location: location
}

output settingsId string = resourceModule.id

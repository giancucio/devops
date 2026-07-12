param containerAppName string = 'ca-portfolio'
param location string = 'eastus'
param environmentId string = 'container-app-env-id'

resource resourceModule 'Microsoft.App/containerApps@2024-01-01-preview' = {
  name: containerAppName
  location: location
}

output containerAppId string = resourceModule.id

param workspaceName string = 'fabric-portfolio'
param location string = 'eastus'

resource resourceModule 'Microsoft.Fabric/workspaces@2024-01-01-preview' = {
  name: workspaceName
  location: location
}

output workspaceId string = resourceModule.id

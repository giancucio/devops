targetScope = 'resourceGroup'

param location string = resourceGroup().location
param workspaceName string
param sku string = 'standard'
param tags object = {}

resource workspace 'Microsoft.Databricks/workspaces@2023-02-01' = {
  name: workspaceName
  location: location
  tags: tags
  sku: {
    name: sku
  }
  properties: {}
}

output workspaceId string = workspace.id
output workspaceUrl string = workspace.properties.workspaceUrl

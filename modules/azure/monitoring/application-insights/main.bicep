targetScope = 'resourceGroup'

param location string = resourceGroup().location
param appInsightsName string
param workspaceResourceId string
param tags object = {}

resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  name: appInsightsName
  location: location
  tags: tags
  kind: 'web'
  properties: {
    Application_Type: 'web'
    WorkspaceResourceId: workspaceResourceId
  }
}

output appInsightsId string = appInsights.id
output connectionString string = appInsights.properties.ConnectionString

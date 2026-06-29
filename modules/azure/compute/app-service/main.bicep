targetScope = 'resourceGroup'

param location string = resourceGroup().location
param appName string
param appServicePlanId string
param linuxFxVersion string = 'NODE|20-lts'
param tags object = {}

resource app 'Microsoft.Web/sites@2022-09-01' = {
  name: appName
  location: location
  tags: tags
  kind: 'app,linux'
  properties: {
    serverFarmId: appServicePlanId
    httpsOnly: true
    siteConfig: {
      linuxFxVersion: linuxFxVersion
      ftpsState: 'Disabled'
      minTlsVersion: '1.2'
    }
  }
}

output appServiceId string = app.id
output defaultHostName string = app.properties.defaultHostName

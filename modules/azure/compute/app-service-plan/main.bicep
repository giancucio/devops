targetScope = 'resourceGroup'

param location string = resourceGroup().location
param appServicePlanName string
param skuName string = 'B1'
param tags object = {}

resource plan 'Microsoft.Web/serverfarms@2022-09-01' = {
  name: appServicePlanName
  location: location
  tags: tags
  sku: {
    name: skuName
  }
  properties: {
    reserved: true
  }
  kind: 'linux'
}

output appServicePlanId string = plan.id

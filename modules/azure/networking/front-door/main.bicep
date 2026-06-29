targetScope = 'resourceGroup'

param location string = 'global'
param profileName string
param endpointName string
param tags object = {}

resource profile 'Microsoft.Cdn/profiles@2023-05-01' = {
  name: profileName
  location: location
  tags: tags
  sku: {
    name: 'Standard_AzureFrontDoor'
  }
}

resource endpoint 'Microsoft.Cdn/profiles/afdEndpoints@2023-05-01' = {
  parent: profile
  name: endpointName
  location: location
  properties: {
    enabledState: 'Enabled'
  }
}

output profileId string = profile.id
output endpointHostName string = endpoint.properties.hostName

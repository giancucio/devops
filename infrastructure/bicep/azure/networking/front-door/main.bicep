param profileName string = 'frontdoor-portfolio'
param location string = 'global'

resource resourceModule 'Microsoft.Cdn/profiles@2023-05-01' = {
  name: profileName
  location: location
  properties: {
    sku: {
      name: 'Standard_AzureFrontDoor'
    }
  }
}

output profileId string = resourceModule.id

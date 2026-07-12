param location string = 'eastus'
param pricingTier string = 'Standard'

resource resourceModule 'Microsoft.Security/pricings@2023-01-01-preview' = {
  name: 'default'
  location: location
}

output pricingId string = resourceModule.id

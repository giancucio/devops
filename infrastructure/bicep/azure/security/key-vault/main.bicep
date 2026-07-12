param keyVaultName string = 'kv-portfolio'
param location string = 'eastus'
param tenantId string = '00000000-0000-0000-0000-000000000000'

resource resourceModule 'Microsoft.KeyVault/vaults@2024-04-01' = {
  name: keyVaultName
  location: location
  properties: {
    properties: {
      sku: {
        family: 'A'
        name: 'standard'
      }
      tenantId: '00000000-0000-0000-0000-000000000000'
    }
  }
}

output keyVaultId string = resourceModule.id

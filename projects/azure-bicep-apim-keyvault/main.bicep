targetScope = 'resourceGroup'

module keyVault '../../modules/azure/security/key-vault/main.bicep' = {
  name: 'keyVault'
  params: {
    keyVaultName: 'kvportfolio001'
  }
}

module apim '../../modules/azure/integration/api-management/main.bicep' = {
  name: 'apim'
  params: {
    apimName: 'apim-portfolio-dev'
    publisherEmail: 'devops@example.com'
  }
}

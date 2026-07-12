param firewallName string = 'azfw-portfolio'
param location string = 'eastus'

resource resourceModule 'Microsoft.Network/azureFirewalls@2023-05-01' = {
  name: firewallName
  location: location
}

output firewallId string = resourceModule.id

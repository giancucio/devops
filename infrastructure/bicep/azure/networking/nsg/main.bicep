param nsgName string = 'nsg-portfolio'
param location string = 'eastus'

resource resourceModule 'Microsoft.Network/networkSecurityGroups@2023-05-01' = {
  name: nsgName
  location: location
}

output nsgId string = resourceModule.id

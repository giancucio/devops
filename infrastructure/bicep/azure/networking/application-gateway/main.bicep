param gatewayName string = 'appgw-portfolio'
param location string = 'eastus'

resource resourceModule 'Microsoft.Network/applicationGateways@2023-02-01' = {
  name: gatewayName
  location: location
}

output gatewayId string = resourceModule.id

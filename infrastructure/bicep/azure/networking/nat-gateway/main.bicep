param natGatewayName string = 'natgw-portfolio'
param location string = 'eastus'

resource resourceModule 'Microsoft.Network/natGateways@2023-05-01' = {
  name: natGatewayName
  location: location
}

output natGatewayId string = resourceModule.id

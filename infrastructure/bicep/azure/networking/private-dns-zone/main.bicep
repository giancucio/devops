param zoneName string = 'privatelinkzone'
param location string = 'global'

resource resourceModule 'Microsoft.Network/privateDnsZones@2020-06-01' = {
  name: zoneName
  location: location
}

output zoneId string = resourceModule.id

targetScope = 'resourceGroup'

param zoneName string = 'privatelink.blob.core.windows.net'
param tags object = {}

resource zone 'Microsoft.Network/privateDnsZones@2020-06-01' = {
  name: zoneName
  location: 'global'
  tags: tags
}

output privateDnsZoneId string = zone.id

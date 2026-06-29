targetScope = 'subscription'

param resourceGroupName string
param location string = 'japaneast'
param tags object = {
  environment: 'dev'
  owner: 'devops'
}

resource rg 'Microsoft.Resources/resourceGroups@2022-09-01' = {
  name: resourceGroupName
  location: location
  tags: tags
}

output resourceGroupName string = rg.name
output resourceGroupId string = rg.id

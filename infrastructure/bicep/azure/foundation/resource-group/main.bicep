param resourceGroupName string = 'rg-portfolio'
param location string = 'eastus'

resource resourceModule 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: resourceGroupName
  location: location
}

output resourceGroupId string = resourceModule.id

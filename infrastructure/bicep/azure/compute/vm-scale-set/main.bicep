param vmssName string = 'vmss-portfolio'
param location string = 'eastus'
param instanceCount int = 2

resource resourceModule 'Microsoft.Compute/virtualMachineScaleSets@2024-04-01' = {
  name: vmssName
  location: location
}

output vmssId string = resourceModule.id

param vmName string = 'vm-portfolio'
param location string = 'eastus'
param vmSize string = 'Standard_DS1_v2'
param adminUsername string = 'azureuser'

resource resourceModule 'Microsoft.Compute/virtualMachines@2024-04-01' = {
  name: vmName
  location: location
}

output vmId string = resourceModule.id

param planName string = 'asp-portfolio'
param location string = 'eastus'
param skuName string = 'P1v2'

resource resourceModule 'Microsoft.Web/serverfarms@2022-03-01' = {
  name: planName
  location: location
}

output planId string = resourceModule.id

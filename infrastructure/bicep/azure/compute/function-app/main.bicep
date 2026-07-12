param functionName string = 'func-portfolio'
param location string = 'eastus'
param servicePlanId string = 'service-plan-id'

resource resourceModule 'Microsoft.Web/sites@2022-03-01' = {
  name: functionName
  location: location
  properties: {
    kind: 'functionapp'
  }
}

output functionId string = resourceModule.id

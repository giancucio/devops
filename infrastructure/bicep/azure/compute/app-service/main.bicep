param appName string = 'app-portfolio'
param location string = 'eastus'
param servicePlanId string = 'service-plan-id'

resource resourceModule 'Microsoft.Web/sites@2022-03-01' = {
  name: appName
  location: location
}

output appId string = resourceModule.id

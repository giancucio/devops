param componentName string = 'appinsights-portfolio'
param location string = 'eastus'
param applicationType string = 'web'

resource resourceModule 'Microsoft.Insights/components@2022-06-15' = {
  name: componentName
  location: location
}

output componentId string = resourceModule.id

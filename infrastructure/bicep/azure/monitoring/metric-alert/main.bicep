param location string = 'eastus'
param alertName string = 'metricAlert'
param targetResourceId string = '/subscriptions/.../resourceGroups/.../providers/Microsoft.Compute/virtualMachines/...'
param criteriaValue int = 80

resource resourceModule 'Microsoft.Insights/metricAlerts@2018-03-01' = {
  name: alertName
  location: location
}

output alertId string = resourceModule.id

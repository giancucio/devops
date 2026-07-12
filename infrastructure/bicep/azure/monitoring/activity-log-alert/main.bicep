param location string = 'eastus'
param alertName string = 'activityLogAlert'
param scope string = '/subscriptions/<subscriptionId>'

resource resourceModule 'Microsoft.Insights/activityLogAlerts@2017-04-01' = {
  name: alertName
  location: location
}

output alertId string = resourceModule.id

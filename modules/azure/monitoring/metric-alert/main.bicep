targetScope = 'resourceGroup'

param alertName string
param targetResourceId string
param actionGroupId string
param metricName string = 'Percentage CPU'
param threshold int = 80

resource alert 'Microsoft.Insights/metricAlerts@2018-03-01' = {
  name: alertName
  location: 'global'
  properties: {
    description: 'Sample metric alert'
    severity: 3
    enabled: true
    scopes: [
      targetResourceId
    ]
    evaluationFrequency: 'PT5M'
    windowSize: 'PT5M'
    criteria: {
      'odata.type': 'Microsoft.Azure.Monitor.SingleResourceMultipleMetricCriteria'
      allOf: [
        {
          name: 'metric1'
          metricName: metricName
          operator: 'GreaterThan'
          threshold: threshold
          timeAggregation: 'Average'
          criterionType: 'StaticThresholdCriterion'
        }
      ]
    }
    actions: [
      {
        actionGroupId: actionGroupId
      }
    ]
  }
}

output alertId string = alert.id

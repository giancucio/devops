targetScope = 'resourceGroup'

param diagnosticSettingName string = 'diag-default'
param targetResourceId string
param logAnalyticsWorkspaceId string

resource diag 'Microsoft.Insights/diagnosticSettings@2021-05-01-preview' = {
  name: diagnosticSettingName
  scope: resource(targetResourceId, '2021-01-01')
  properties: {
    workspaceId: logAnalyticsWorkspaceId
    logs: []
    metrics: [
      {
        category: 'AllMetrics'
        enabled: true
      }
    ]
  }
}

output diagnosticSettingId string = diag.id

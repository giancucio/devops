targetScope = 'resourceGroup'

param aksResourceId string
param workspaceResourceId string

resource extension 'Microsoft.KubernetesConfiguration/extensions@2023-05-01' = {
  name: 'azuremonitor-containers'
  scope: resource(aksResourceId, '2023-01-01')
  properties: {
    extensionType: 'Microsoft.AzureMonitor.Containers'
    autoUpgradeMinorVersion: true
    configurationSettings: {
      'logAnalyticsWorkspaceResourceID': workspaceResourceId
    }
  }
}

output extensionId string = extension.id

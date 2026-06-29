targetScope = 'resourceGroup'

param location string = resourceGroup().location
param logicAppName string
param tags object = {}

resource workflow 'Microsoft.Logic/workflows@2019-05-01' = {
  name: logicAppName
  location: location
  tags: tags
  properties: {
    state: 'Enabled'
    definition: {
      '$schema': 'https://schema.management.azure.com/providers/Microsoft.Logic/schemas/2016-06-01/workflowdefinition.json#'
      contentVersion: '1.0.0.0'
      triggers: {}
      actions: {}
      outputs: {}
    }
  }
}

output logicAppId string = workflow.id

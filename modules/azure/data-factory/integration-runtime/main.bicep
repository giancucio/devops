targetScope = 'resourceGroup'

param dataFactoryName string
param integrationRuntimeName string = 'AutoResolveIntegrationRuntime'

resource adf 'Microsoft.DataFactory/factories@2018-06-01' existing = {
  name: dataFactoryName
}

resource ir 'Microsoft.DataFactory/factories/integrationRuntimes@2018-06-01' = {
  parent: adf
  name: integrationRuntimeName
  properties: {
    type: 'Managed'
    typeProperties: {
      computeProperties: {
        location: 'AutoResolve'
      }
    }
  }
}

output integrationRuntimeId string = ir.id

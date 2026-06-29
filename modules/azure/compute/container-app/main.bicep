targetScope = 'resourceGroup'

param location string = resourceGroup().location
param containerAppName string
param environmentId string
param image string = 'mcr.microsoft.com/azuredocs/containerapps-helloworld:latest'
param tags object = {}

resource app 'Microsoft.App/containerApps@2023-05-01' = {
  name: containerAppName
  location: location
  tags: tags
  properties: {
    managedEnvironmentId: environmentId
    configuration: {
      ingress: {
        external: true
        targetPort: 80
      }
    }
    template: {
      containers: [
        {
          name: 'app'
          image: image
          resources: {
            cpu: json('0.25')
            memory: '0.5Gi'
          }
        }
      ]
      scale: {
        minReplicas: 1
        maxReplicas: 3
      }
    }
  }
}

output containerAppId string = app.id

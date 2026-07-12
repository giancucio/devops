param topicName string = 'eventgrid-topic'
param location string = 'eastus'

resource resourceModule 'Microsoft.EventGrid/topics@2024-06-01' = {
  name: topicName
  location: location
}

output topicId string = resourceModule.id

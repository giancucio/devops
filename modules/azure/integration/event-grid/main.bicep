targetScope = 'resourceGroup'

param location string = resourceGroup().location
param topicName string
param tags object = {}

resource topic 'Microsoft.EventGrid/topics@2022-06-15' = {
  name: topicName
  location: location
  tags: tags
}

output topicId string = topic.id
output endpoint string = topic.properties.endpoint

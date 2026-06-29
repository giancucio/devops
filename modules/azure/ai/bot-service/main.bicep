targetScope = 'resourceGroup'

param location string = 'global'
param botName string
param microsoftAppId string = ''
param tags object = {}

resource bot 'Microsoft.BotService/botServices@2022-09-15' = {
  name: botName
  location: location
  tags: tags
  sku: {
    name: 'F0'
  }
  kind: 'azurebot'
  properties: {
    displayName: botName
    endpoint: 'https://example.com/api/messages'
    msaAppId: microsoftAppId
  }
}

output botId string = bot.id

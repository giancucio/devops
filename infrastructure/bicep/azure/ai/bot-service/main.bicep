param botName string = 'bot-portfolio'
param location string = 'eastus'
param appId string

resource resourceModule 'Microsoft.BotService/botServices@2021-05-01' = {
  name: botName
  location: location
  properties: {
    developerAppInsightKey: ''
  }
}

output botId string = resourceModule.id

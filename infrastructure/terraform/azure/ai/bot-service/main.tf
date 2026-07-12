resource "azurerm_resource" "this" {
  name                = var.name
  type                = "Microsoft.BotService/botServices"
  api_version         = "2021-05-01"
  location            = var.location
  resource_group_name = var.resource_group_name
  properties          = {}
}

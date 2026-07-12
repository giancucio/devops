resource "azurerm_resource" "this" {
  name                = var.accountName
  type                = "Microsoft.CognitiveServices/accounts"
  api_version         = "2021-10-01"
  location            = var.location
  resource_group_name = var.resource_group_name
  properties          = {}
}

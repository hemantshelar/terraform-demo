
resource "azurerm_log_analytics_workspace" "law" {
  name                = "law-dev-tfdemo-aae"
  location            = "Australia East"
  resource_group_name = "rg-dev-tfdemo-aee"
  sku                 = "PerGB2018"
  retention_in_days   = 30
}
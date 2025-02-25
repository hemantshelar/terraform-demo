resource "azurerm_application_insights" "appinsight" {
  name                = "appinsight-dev-tfdemo-aae"
  location            = "Australia East"
  resource_group_name = "rg-dev-tfdemo-aee"
  application_type    = "web"
  workspace_id = var.law_id
}
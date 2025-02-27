module "common" {
  source = "../common"
}
resource "azurerm_application_insights" "appinsight" {
  name                = "appinsight-${module.common.env}-${module.common.tla}-${module.common.location-suffix}"
  location            = "${module.common.rg-location}"
  resource_group_name = "${module.common.rgname}"
  application_type    = "web"
  workspace_id = var.law_id
}
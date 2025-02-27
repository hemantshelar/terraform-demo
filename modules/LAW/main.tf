
module "common" {
  source = "../common"
}

resource "azurerm_log_analytics_workspace" "law" {
  name                = "law-${module.common.env}-${module.common.tla}-${module.common.location-suffix}"
  location            = "${module.common.rg-location}"
  resource_group_name = "${module.common.rgname}"
  sku                 = "PerGB2018"
  retention_in_days   = 30
}
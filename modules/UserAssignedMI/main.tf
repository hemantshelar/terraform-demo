module "common" {
  source = "../common"
}

resource "azurerm_user_assigned_identity" "uami" {
  location            = "${module.common.rg-location}" 
  name                = "uami-${module.common.env}-${module.common.tla}-${module.common.location-suffix}"
  resource_group_name = "${module.common.rgname}"
}
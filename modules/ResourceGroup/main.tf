# Purpose: Create a resource group in Azure
# Usage: rg-dev-tfdemo-aae

module "common" {
  source = "../common"
}
resource "azurerm_resource_group" "rg" {
  name =   "rg-${module.common.env}-${module.common.tla}-${module.common.location-suffix}"
  location = "${module.common.rg-location}"
  tags = {
        environment = "${var.environment}"
    }
}
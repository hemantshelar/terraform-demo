module "common" {
  source = "../common"
}

resource "azurerm_storage_account" "example" {
  name                     = "${var.storage_name}"
  resource_group_name      = "${module.common.rgname}" 
  location                 = "${module.common.rg-location}" 
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "Development"
  }
}
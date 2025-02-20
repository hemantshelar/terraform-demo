resource "azurerm_storage_account" "example" {
  name                     = "${var.storage_name}"
  resource_group_name      = "rg-dev-tfdemo-aee" 
  location                 = "australiaeast" 
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "Development"
  }
}
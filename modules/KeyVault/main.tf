data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "example" {
  name                        = "kv-dev-tfdemo-aae"
  location                    = "australiaeast" 
  resource_group_name         = "rg-dev-tfdemo-aee"
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"
}
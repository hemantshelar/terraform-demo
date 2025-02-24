#https://learn.microsoft.com/en-us/azure/key-vault/keys/quick-create-terraform?tabs=azure-cli
data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "kv" {
  name                        = "kv-dev-tfdemo-aae"
  location                    = "australiaeast" 
  resource_group_name         = "rg-dev-tfdemo-aee"
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false
  enable_rbac_authorization = true

  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions    = ["List", "Create", "Delete", "Get", "Purge", "Recover", "Update", "GetRotationPolicy", "SetRotationPolicy"]
    secret_permissions = ["Set"]
  }
}

resource "azurerm_role_assignment" "kvra" {
    scope                = azurerm_key_vault.kv.id
    role_definition_name = "Key Vault Secrets Officer"
    principal_id         = data.azurerm_client_config.current.object_id
}
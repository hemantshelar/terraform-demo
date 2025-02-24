
resource "azurerm_user_assigned_identity" "uami" {
  location            = "australiaeast" 
  name                = "uami-dev-tfdemo-aee"
  resource_group_name = "rg-dev-tfdemo-aee"
}
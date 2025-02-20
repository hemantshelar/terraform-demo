//asp-dev-tfdemo-aae
resource "azurerm_service_plan" "spdefault" {
  name                = "asp-dev-tfdemo-aae"
  resource_group_name = "rg-dev-tfdemo-aee"
  location            = "australia east"
  os_type             = "Linux"
  sku_name            = "F1"
}

//webapp-dev-tfdemo-aae

resource "azurerm_linux_web_app" "example" {
  name                = "webapp-dev-tfdemo-aae"
  resource_group_name = "rg-dev-tfdemo-aee"
  location            = "australia east" 
  service_plan_id     = azurerm_service_plan.spdefault.id

  site_config {
    always_on = false
    application_stack {
        dotnet_version = "8.0"
    }
  }
}
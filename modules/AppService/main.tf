//asp-dev-tfdemo-aae
module "common" {
  source = "../common"
}

resource "azurerm_service_plan" "spdefault" {
  name                = "asp-${module.common.env}-${module.common.tla}-${module.common.location-suffix}"
  resource_group_name = "${module.common.rgname}"
  location            = "${module.common.rg-location}"
  os_type             = "Linux"
  sku_name            = "F1"
}

//webapp-dev-tfdemo-aae

resource "azurerm_linux_web_app" "webapp" {
  name                = "web-${module.common.env}-${module.common.tla}-${module.common.location-suffix}"
  resource_group_name = "${module.common.rgname}"
  location            = "${module.common.rg-location}" 
  service_plan_id     = azurerm_service_plan.spdefault.id

  identity {
    type = "UserAssigned"
    identity_ids = [var.uami_principal_id] 
  }

    connection_string {
        name  = "Database"
        type  = "MySql"
        value = "Server=myServerAddress;Database=myDataBase;Uid=myUsername;Pwd=myPassword;"
    }
  site_config {
    always_on = false 
    application_stack {
        dotnet_version = "8.0"
    }
  }
}
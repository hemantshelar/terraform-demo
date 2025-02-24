# Purpose: Create a resource group in Azure
# Usage: rg-dev-tfdemo-aae

resource "azurerm_resource_group" "rg" {
  name     = "${var.rg-prefix}-${var.env-prefix}-${var.project-name}-${var.location-prefix}"
  location = "${var.location}"
  tags = {
        environment = "${var.environment}"
    }
}
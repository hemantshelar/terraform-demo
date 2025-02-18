# Purpose: Create a resource group in Azure
# Usage: rg-dev-tfdemo-aae

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~>3.0"
    }
  }
}

provider "azurerm" {
  features {}
}
resource "azurerm_resource_group" "rg" {
  name     = "${var.rg-prefix}-${var.env-prefix}-${var.project-name}-${var.location-prefix}"
  location = "${var.location}"
  tags = {
        environment = "${var.environment}"
    }
}
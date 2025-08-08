terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "rg-tf"
    storage_account_name = "tfstorageaccount9999930"
    container_name       = "tfstate"
    key                  = "webapp.terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
  subscription_id = "3490ed46-a743-4ab8-8acf-039a9546a037"
}

resource "azurerm_resource_group" "rg" {
  name     = "devops-rg"
  location = "East US"
}


resource "azurerm_storage_account" "storage" {
  name                     = "devopsstorageacct0001"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
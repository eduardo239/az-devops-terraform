provider "azurerm" {
  features {}
  subscription_id = "${var.subscription_id}"
}

resource "azurerm_resource_group" "rg" {
    name = var.resource_group
    location = var.location
}

resource "azurerm_service_plan" "app_service_plan" {
  name                = "${var.app_name}-plan"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  sku_name = "B1"
  os_type = "Linux"

}

resource "azurerm_linux_web_app" "webapp" {
    name = var.app_name
    location = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name
    service_plan_id = azurerm_service_plan.app_service_plan.id


    site_config {

    }
}


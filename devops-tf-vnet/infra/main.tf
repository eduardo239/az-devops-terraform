provider "azurerm" {
  features {}
  subscription_id = "3490ed46-a743-4ab8-8acf-039a9546a037"
}

resource "azurerm_resource_group" "rg" {
    name = var.resource_group_name
    location = var.location
}

resource "azurerm_virtual_network" "vnet" {
    name = var.vnet_name
    address_space = [var.vnet_address_space]
    location = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_subnet" "subnet" {
    name  = var.subnet_name
    resource_group_name = azurerm_resource_group.rg.name
    virtual_network_name = azurerm_virtual_network.vnet.name
    address_prefixes = [var.subnet_prefix]
}

resource "azurerm_subnet" "firewall_subnet" {
    name = "AzureFirewallSubnet"
    resource_group_name = azurerm_resource_group.rg.name
    virtual_network_name = azurerm_virtual_network.vnet.name
    address_prefixes = [var.firewall_subnet_prefix]
}

resource "azurerm_public_ip" "firewall_pip" {
    name = "firewall-pip"
    location = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name
    allocation_method = "Static"
    sku = "Standard"
}

resource "azurerm_firewall" "firewall" {
    name = "firewall"
    location = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name

    ip_configuration {
        name = "configuration"
        subnet_id= azurerm_subnet.firewall_subnet.id
        public_ip_address_id = azurerm_public_ip.firewall_pip.id
    }

    sku_name = "AZFW_VNet"
    sku_tier = "Standard"
}
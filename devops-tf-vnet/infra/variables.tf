variable "location" {
    default = "eastus"
}

variable "resource_group_name" {
    default = "rg-firewall"
}

variable "vnet_name" {
    default = "vnet-firewall"
}

variable "vnet_address_space" {
    default = "10.0.0.0/16"
}

variable "subnet_name" {
    default = "subnet1"
}

variable "subnet_prefix" {
    default = "10.0.1.0/24"
}

variable "firewall_subnet_prefix" {
  default = "10.0.2.0/24"
}
variable "location"            { default = "eastus" }
variable "resource_group_name" { default = "vm-rg" }
variable "vnet_name"           { default = "vm-vnet" }
variable "address_space"       { default = "10.0.0.0/16" }
variable "subnet_name"         { default = "vm-subnet" }
variable "subnet_prefix"       { default = "10.0.1.0/24" }
variable "admin_username"      { default = "azureuser" }
variable "admin_password"      { sensitive = true }
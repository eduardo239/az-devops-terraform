variable "location" {
    type = string
    default = "eastus"
}

variable "resource_group" {
    type = string
    default = "rg-tf"
}

variable "app_name" {
    type = string
    default = "webapp-terraform"
}

variable "subscription_id" {
    type = string
    description = "Azure Subscription ID where the resources will be created"
    default = "3490ed46-a743-4ab8-8acf-039a9546a037"
}

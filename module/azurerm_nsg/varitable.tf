variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
  }

variable "rg_location" {
  description = "The Azure region where the resource group will be created."
  type        = string
  default     = "East US"
  sensitive = true
  
}

variable "nsg_name" {}



variable "subnet_id" {}


# data "azurerm_subnet" "subnet1" {
#   name                 = var.subnet_name
#   virtual_network_name = var.virtual_network_name
#   resource_group_name  = var.resource_group_name
# }

# data "azurerm_subnet" "subnet2" {
#   name                 = var.subnet_name
#   virtual_network_name = var.virtual_network_name
#   resource_group_name  = var.resource_group_name
# }



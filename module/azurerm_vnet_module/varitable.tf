variable "vm_name" {
  description = "The name of the virtual machine."
  type        = string
  
}
variable "vm_location" {
  description = "The Azure region where the virtual machine will be created."
  type        = string
  default     = "East US"
  
}
variable "resource_group_name" {
  description = "The name of the resource group where the virtual machine will be created."
  type        = string
  
}

variable "vm_address_space" {
  description = "The address space for the virtual network associated with the virtual machine."
  type        = list(string)
  default     = ["10.0.0.0/16"]
}
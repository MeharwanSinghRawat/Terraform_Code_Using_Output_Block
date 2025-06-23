
variable "nic_name" {
  description = "The name of the network interface."
  type        = string
}
variable "location" {
  description = "The Azure region where the network interface will be created."
  type        = string
  default     = "East US"
}
variable "resource_group_name" {
  description = "The name of the resource group where the network interface will be created."
  type        = string
}
variable "ip_configuration_name" {
  description = "The name of the IP configuration for the network interface."
  type        = string
}
variable "subnet_id" {
  description = "The ID of the subnet to which the network interface will be associated."
  type        = string
}
variable "private_ip_address_allocation" {
  description = "The private IP address allocation method (Static or Dynamic)."
  type        = string
  default     = "Dynamic"
}
variable "public_ip_address_id" {
  description = "The ID of the public IP address to associate with the network interface (optional)."
  type        = string
  default     = ""
}
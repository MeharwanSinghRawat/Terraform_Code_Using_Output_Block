variable "vm_name" {
  description = "The name of the virtual machine."
  type        = string
  default     = "myVM"
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
variable "vm_size" {
  description = "The size of the virtual machine."
  type        = string
  default     = "Standard_DS1_v2"
}

variable "network_interface_id" {
  description = "The ID of the network interface associated with the virtual machine."
  type        = string
}
variable "disable_password_authentication" {}
variable "os_disk_name" {
  description = "The name of the OS disk for the virtual machine."
  type        = string
  default     = "myOSDisk"
}
variable "os_disk_caching" {
  description = "The caching type for the OS disk (e.g., None, ReadOnly, ReadWrite)."
  type        = string
  default     = "ReadWrite"

}
variable "os_disk_storage_account_type" {

}

# variable "admin_username" {
#   description = "The administrator username for the virtual machine."
#   type        = string
#   default     = "azureuser"
# }
# variable "admin_password" {
#   description = "The administrator password for the virtual machine."
#   type        = string
#   default     = "P@ssw0rd1234!"
# }
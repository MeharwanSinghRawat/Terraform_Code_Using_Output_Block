
resource "azurerm_virtual_network" "myVNet" {
  name                = var.vm_name
  address_space       = var.vm_address_space
    location            = var.vm_location
    resource_group_name = var.resource_group_name
  
}


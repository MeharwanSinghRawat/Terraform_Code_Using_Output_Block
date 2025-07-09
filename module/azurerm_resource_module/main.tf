resource "azurerm_resource_group" "rg1" {
  name     = var.resource_group_name
  location = var.rg_location
}

resource "azurerm_resource_group" "rg2" {
  name     = "Uday"
  location = "centralus"
  
}




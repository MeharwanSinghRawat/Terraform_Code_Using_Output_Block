resource "azurerm_network_security_group" "nsg" {
  name                = var.nsg_name
  location            = var.rg_location
  resource_group_name = var.resource_group_name

  security_rule {
    name                       = "Allow-SSH"
    priority                   = 1000
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"

  }
  security_rule {
    name                       = "Allow-HTTP"
    priority                   = 2000
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  
  security_rule {
    name                       = "Allow-RDP"
    priority                   = 4000
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_subnet_network_security_group_association" "nsg1" {
  subnet_id                 = var.subnet_id
  network_security_group_id = data.azurerm_network_security_group.nsg1.id
}

resource "azurerm_subnet_network_security_group_association" "nsg2" {
  subnet_id                 = var.subnet_id
  network_security_group_id = data.azurerm_network_security_group.nsg2.id
}

data "azurerm_network_security_group" "nsg1" {
  name                = var.nsg_name
  resource_group_name = var.resource_group_name
}
data "azurerm_network_security_group" "nsg2" {
  name                = var.nsg_name
  resource_group_name = var.resource_group_name
}
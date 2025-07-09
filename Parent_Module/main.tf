module "resource_group" {
  source              = "../module/azurerm_resource_module"
  resource_group_name = "Meharwan-rg"
  rg_location         = "West Europe"

}

module "resource_group1" {
  source              = "../module/azurerm_resource_module"
  resource_group_name = "uday"
  rg_location         = "West Europe"

}



module "virtual_network" {
  source              = "../module/azurerm_vnet_module"
  vm_name             = "meharvnet"
  vm_location         = module.resource_group.rg_location
  resource_group_name = module.resource_group.resource_group_name
  vm_address_space    = ["10.0.0.0/16"]
  depends_on          = [module.resource_group]
}
module "virtual_vnet" {
  source              = "../module/azurerm_vnet_module"
  vm_name             = "meharvirtual"
  vm_location         = module.resource_group.rg_location
  resource_group_name = module.resource_group.resource_group_name
  vm_address_space    = ["10.0.1.0/16"]
  depends_on          = [module.resource_group]
}

module "azurerm_subnet1" {
  source               = "../module/azurerm_subnet_module"
  subnet_name          = "meharsubnet1"
  virtual_network_name = module.virtual_network.vnet_name
  resource_group_name  = module.resource_group.resource_group_name
  address_prefixes     = ["10.0.0.0/24"]
  depends_on           = [module.virtual_network, module.resource_group]

}

module "azurerm_subnet2" {
  source               = "../module/azurerm_subnet_module"
  subnet_name          = "meharsubnet2"
  virtual_network_name = module.virtual_network.vnet_name
  resource_group_name  = module.resource_group.resource_group_name
  address_prefixes     = ["10.0.1.0/24"]
  depends_on           = [module.virtual_network, module.resource_group]

}

module "azurerm_network_security_group1" {
  depends_on          = [module.azurerm_subnet1,module.resource_group]
  source              = "../module/azurerm_nsg"
  nsg_name            = "nsg1"
  rg_location         = module.resource_group.rg_location
  resource_group_name = module.resource_group.resource_group_name
  subnet_id           = module.azurerm_subnet1.subnet_id
}

module "azurerm_network_security_group2" {
  depends_on          = [module.azurerm_subnet2,module.resource_group]
  source              = "../module/azurerm_nsg"
  nsg_name            = "nsg2"
  rg_location         = module.resource_group.rg_location
  resource_group_name = module.resource_group.resource_group_name
  subnet_id           = module.azurerm_subnet2.subnet_id
}


module "Public_IP1" {
  source              = "../module/azurerm_public_ip_module"
  public_ip_name      = "MeharPIP1"
  resource_group_name = module.resource_group.resource_group_name
  location            = module.resource_group.rg_location
  allocation_method   = "Static"
  depends_on          = [module.resource_group]
}

module "Public_IP2" {
  source              = "../module/azurerm_public_ip_module"
  public_ip_name      = "MeharPIP2"
  resource_group_name = module.resource_group.resource_group_name
  location            = module.resource_group.rg_location
  allocation_method   = "Static"
  depends_on          = [module.resource_group]
}

module "named_network_interface1" {
  source                        = "../module/azurerm_nic_module"
  nic_name                      = "meharnic1"
  location                      = module.resource_group.rg_location
  resource_group_name           = module.resource_group.resource_group_name
  ip_configuration_name         = "myIPConfig1"
  subnet_id                     = module.azurerm_subnet1.subnet_id
  private_ip_address_allocation = "Dynamic"
  public_ip_address_id          = module.Public_IP1.public_ip_id
  depends_on                    = [module.azurerm_subnet1, module.Public_IP1]
}

module "named_network_interface2" {
  source                        = "../module/azurerm_nic_module"
  nic_name                      = "meharnic2"
  location                      = module.resource_group.rg_location
  resource_group_name           = module.resource_group.resource_group_name
  ip_configuration_name         = "myIPConfig1"
  subnet_id                     = module.azurerm_subnet2.subnet_id
  private_ip_address_allocation = "Dynamic"
  public_ip_address_id          = module.Public_IP2.public_ip_id
  depends_on                    = [module.azurerm_subnet2, module.Public_IP2]

}


module "named_virtual_machine1" {
  source                          = "../module/azurerm_vm_module"
  vm_name                         = "meharbackendvm"
  resource_group_name             = module.resource_group.resource_group_name
  vm_location                     = module.resource_group.rg_location
  vm_size                         = "Standard_B1s"
  network_interface_id            = module.named_network_interface1.nicId
  disable_password_authentication = false
  os_disk_caching                 = "ReadWrite"
  os_disk_storage_account_type    = "Standard_LRS"
  depends_on                      = [module.named_network_interface1]

}


module "named_virtual_machine2" {
  source                          = "../module/azurerm_vm_module"
  vm_name                         = "meharfrontendvm"
  resource_group_name             = module.resource_group.resource_group_name
  vm_location                     = module.resource_group.rg_location
  vm_size                         = "Standard_B1s"
  network_interface_id            = module.named_network_interface2.nicId
  disable_password_authentication = false
  os_disk_caching                 = "ReadWrite"
  os_disk_storage_account_type    = "Standard_LRS"
  depends_on                      = [module.named_network_interface2]

}


module "data_server" {
  source              = "../module/azurerm_data_server"
  sqlname             = "meharwanserversql"
  resource_group_name = module.resource_group.resource_group_name
  location            = "central india"
  login               = "Useradmin"
  password            = "Useradmin@1234"
  depends_on          = [module.resource_group]
}

module "azurerm_sql_database" {
  source        = "../module/azurerm_database"
  database_name = "meharwandatabase"
  server_id     = module.data_server.server_id
  depends_on    = [module.data_server]

}




  
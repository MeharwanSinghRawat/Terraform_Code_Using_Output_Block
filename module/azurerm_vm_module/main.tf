resource "azurerm_linux_virtual_machine" "example" {
  name                = var.vm_name
  resource_group_name = var.resource_group_name
  location            = var.vm_location
  size                = var.vm_size
  admin_username      = data.azurerm_key_vault_secret.username.value
  admin_password =  data.azurerm_key_vault_secret.password.value
  network_interface_ids = [
    var.network_interface_id
  ]

 disable_password_authentication = var.disable_password_authentication

  os_disk {
    caching              = var.os_disk_caching
    storage_account_type = var.os_disk_storage_account_type
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts"
    version   = "latest"
  }

 custom_data = base64encode(<<EOF
#!/bin/bash
apt-get update
apt-get install -y nginx
systemctl enable nginx
systemctl start nginx
EOF
  )

}

data "azurerm_key_vault" "keyvault" {
  name                = "B17-G35-keyvault"
  resource_group_name = "Santan-keyvault"
}

data "azurerm_key_vault_secret" "username" {
  name         = "Meharvmusername"
  key_vault_id = data.azurerm_key_vault.keyvault.id
}


data "azurerm_key_vault_secret" "password" {
  name         = "meharvmpassword"
  key_vault_id = data.azurerm_key_vault.keyvault.id
}


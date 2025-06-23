output "vnet_name" {
  description = "The name of the virtual network created."
  value       = azurerm_virtual_network.myVNet.name
}
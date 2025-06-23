output "resource_group_name" {
  description = "The name of the resource group created."
  value       = azurerm_resource_group.rg1.name
  
}

output "rg_location" {
  description = "The location of the resource group created."
  value       = azurerm_resource_group.rg1.location
  
}
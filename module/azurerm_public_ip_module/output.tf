output "public_ip_address" {
  description = "The public IP address created."
  value       = azurerm_public_ip.pip1.ip_address
}

output "public_ip_id" {
  description = "The ID of the public IP address created."
  value       = azurerm_public_ip.pip1.id
  
}
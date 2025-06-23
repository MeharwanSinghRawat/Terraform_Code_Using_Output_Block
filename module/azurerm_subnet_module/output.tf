
output "subnet_id" {
    description = "The ID of the subnet created."
    value       = azurerm_subnet.subnet.id
}

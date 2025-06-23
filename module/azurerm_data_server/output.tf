output "server_name" {

  value = azurerm_mssql_server.sql.name
  
}

output "server_id" {
  
  value = azurerm_mssql_server.sql.id
}
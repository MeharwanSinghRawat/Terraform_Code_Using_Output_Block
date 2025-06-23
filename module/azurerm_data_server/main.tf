resource "azurerm_mssql_server" "sql" {
  name                         = var.sqlname
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = "12.0"
  administrator_login          = "mradministrator"
  administrator_login_password = "thisIsDog11"

}



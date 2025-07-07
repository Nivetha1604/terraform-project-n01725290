resource "azurerm_postgresql_server" "this" {
  name                = var.db_name
  location            = var.location
  resource_group_name = var.rg_name
  administrator_login = var.admin_username
  administrator_login_password = var.admin_password
  version             = "11"

  sku_name   = "B_Gen5_1"
  storage_mb = 5120
  backup_retention_days        = 7
  geo_redundant_backup_enabled = false
  auto_grow_enabled            = true
  ssl_enforcement_enabled      = true

  public_network_access_enabled = true
}

resource "azurerm_postgresql_database" "this" {
  name                = "appdb"
  resource_group_name = var.rg_name
  server_name         = azurerm_postgresql_server.this.name
  charset             = "UTF8"
  collation           = "English_United States.1252"
}

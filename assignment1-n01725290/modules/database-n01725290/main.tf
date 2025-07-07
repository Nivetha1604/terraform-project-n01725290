resource "azurerm_postgresql_flexible_server" "this" {
  name                   = var.db_name
  location               = var.location
  resource_group_name    = var.rg_name
  administrator_login    = var.admin_username
  administrator_password = var.admin_password
  version                = "13"

  storage_mb             = 32768
  sku_name               = "GP_Standard_D2s_v3"
  zone                   = "1"

  backup_retention_days  = 7
  delegated_subnet_id    = null
  public_network_access_enabled = true

  lifecycle {
    ignore_changes = [zone]
  }
}

resource "azurerm_postgresql_flexible_server_database" "this" {
  name      = "appdb"
  server_id = azurerm_postgresql_flexible_server.this.id
  collation = "en_US.utf8"
  charset   = "UTF8"
}


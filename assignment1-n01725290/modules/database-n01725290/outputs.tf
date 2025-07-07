output "postgresql_server_name" {
  description = "The name of the PostgreSQL server"
  value       = azurerm_postgresql_server.this.name
}

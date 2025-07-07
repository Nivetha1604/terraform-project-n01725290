output "log_analytics_workspace_name" {
  description = "The name of the Log Analytics workspace"
  value       = azurerm_log_analytics_workspace.this.name
}

output "recovery_vault_name" {
  description = "The name of the Recovery Services vault"
  value       = azurerm_recovery_services_vault.this.name
}

output "storage_account_name" {
  description = "The name of the storage account"
  value       = azurerm_storage_account.this.name
}

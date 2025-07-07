variable "location" {
  description = "Azure region"
  type        = string
}

variable "rg_name" {
  description = "Name of the resource group"
  type        = string
}

variable "log_analytics_name" {
  description = "Name of the Log Analytics workspace"
  type        = string
}

variable "recovery_vault_name" {
  description = "Name of the Recovery Services vault"
  type        = string
}

variable "storage_account_name" {
  description = "Name of the storage account"
  type        = string
}

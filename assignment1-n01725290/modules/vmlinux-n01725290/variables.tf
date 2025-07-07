variable "location" {
  description = "Azure region"
  type        = string
}

variable "rg_name" {
  description = "Name of the resource group"
  type        = string
}

variable "subnet_id" {
  description = "ID of the subnet where the VMs will be deployed"
  type        = string
}

variable "vm_names" {
  description = "Map of Linux VM names"
  type        = map(string)
}

variable "admin_username" {
  description = "Admin username for the VMs"
  type        = string
}

variable "admin_password" {
  description = "Admin password for the VMs"
  type        = string
  sensitive   = true
}

variable "availability_set_name" {
  description = "Name of the availability set"
  type        = string
}

variable "storage_account_uri" {
  description = "Boot diagnostics storage account blob endpoint"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "rg_name" {
  description = "Resource group name"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID"
  type        = string
}

variable "admin_username" {
  description = "Admin username"
  type        = string
}

variable "admin_password" {
  description = "Admin password"
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

variable "vm_count" {
  description = "Number of Windows VMs"
  type        = number
  default     = 1
}

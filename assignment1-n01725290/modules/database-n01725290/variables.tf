variable "location" {
  description = "Azure region"
  type        = string
}

variable "rg_name" {
  description = "Resource group name"
  type        = string
}

variable "db_name" {
  description = "Name of the PostgreSQL server"
  type        = string
}

variable "admin_username" {
  description = "Admin username for the PostgreSQL server"
  type        = string
}

variable "admin_password" {
  description = "Admin password for the PostgreSQL server"
  type        = string
  sensitive   = true
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "rg_name" {
  description = "Name of the resource group"
  type        = string
}

variable "vnet_name" {
  description = "Name of the virtual network"
  type        = string
}

variable "subnet_name" {
  description = "Name of the subnet"
  type        = string
}

variable "address_space" {
  description = "Address space for the VNet"
  type        = list(string)
}

variable "subnet_prefix" {
  description = "Address prefix for the subnet"
  type        = string
}

variable "nsg_name" {
  description = "Name of the Network Security Group"
  type        = string
}

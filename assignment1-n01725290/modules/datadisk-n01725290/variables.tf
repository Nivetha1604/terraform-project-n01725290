variable "location" {
  description = "Azure region"
  type        = string
}

variable "rg_name" {
  description = "Resource group name"
  type        = string
}

variable "vm_ids" {
  description = "List of VM IDs to attach data disks to"
  type        = list(string)
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "rg_name" {
  description = "Resource group name"
  type        = string
}

variable "lb_name" {
  description = "Name of the load balancer"
  type        = string
}

variable "linux_vm_nic_ids" {
  description = "List of NIC IDs for the Linux VMs"
  type        = list(string)
}

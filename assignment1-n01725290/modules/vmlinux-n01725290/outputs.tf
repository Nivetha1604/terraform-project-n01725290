output "linux_vm_hostnames" {
  description = "Hostnames of the Linux VMs"
  value       = [for vm in azurerm_linux_virtual_machine.this : vm.name]
}

output "linux_vm_fqdns" {
  description = "FQDNs (domain labels) of the public IPs"
  value       = [for pip in azurerm_public_ip.this : pip.fqdn]
}

output "linux_vm_private_ips" {
  description = "Private IPs of the Linux VMs"
  value       = [for nic in azurerm_network_interface.this : nic.private_ip_address]
}

output "linux_vm_public_ips" {
  description = "Public IPs of the Linux VMs"
  value       = [for pip in azurerm_public_ip.this : pip.ip_address]
}

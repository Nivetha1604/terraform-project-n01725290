output "windows_vm_hostnames" {
  description = "Hostnames of the Windows VMs"
  value       = [for vm in azurerm_windows_virtual_machine.this : vm.name]
}

output "windows_vm_fqdns" {
  description = "FQDNs of the public IPs"
  value       = [for pip in azurerm_public_ip.this : pip.fqdn]
}

output "windows_vm_private_ips" {
  description = "Private IPs of the Windows VMs"
  value       = [for nic in azurerm_network_interface.this : nic.private_ip_address]
}

output "windows_vm_public_ips" {
  description = "Public IPs of the Windows VMs"
  value       = [for pip in azurerm_public_ip.this : pip.ip_address]
}

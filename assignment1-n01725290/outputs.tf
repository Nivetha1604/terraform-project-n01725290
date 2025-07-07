output "resource_group_name" {
  value = module.rgroup.resource_group_name
}

output "vnet_name" {
  value = module.network.vnet_name
}

output "subnet_name" {
  value = module.network.subnet_name
}

output "log_analytics_workspace" {
  value = module.common.log_analytics_workspace_name
}

output "recovery_services_vault" {
  value = module.common.recovery_vault_name
}

output "storage_account_name" {
  value = module.common.storage_account_name
}

output "linux_vm_hostnames" {
  value = module.linux_vms.linux_vm_hostnames
}

output "windows_vm_hostnames" {
  value = module.windows_vm.windows_vm_hostnames
}

output "load_balancer_name" {
  value = module.loadbalancer.load_balancer_name
}

output "postgresql_server_name" {
  value = module.database.postgresql_server_name
}

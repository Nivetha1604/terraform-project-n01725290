module "rgroup" {
  source   = "./modules/rgroup-n01725290"
  location = var.location
  rg_name  = "n01725290-RG"
}
module "network" {
  source        = "./modules/network-n01725290"
  location      = var.location
  rg_name       = module.rgroup.resource_group_name
  vnet_name     = "n01725290-VNET"
  subnet_name   = "n01725290-SUBNET"
  address_space = ["10.0.0.0/16"]
  subnet_prefix = "10.0.1.0/24"
  nsg_name      = "n01725290-NSG"
}
module "common" {
  source               = "./modules/common-n01725290"
  location             = var.location
  rg_name              = module.rgroup.resource_group_name
  log_analytics_name   = "n01725290-log"
  recovery_vault_name  = "n01725290-recovery"
  storage_account_name = "n01725290diagstorage"
}
module "linux_vms" {
  source                = "./modules/vmlinux-n01725290"
  location              = var.location
  rg_name               = module.rgroup.resource_group_name
  subnet_id             = module.network.subnet_id
  vm_names              = {
    "n01725290-c-vm1" = "Linux VM 1"
    "n01725290-c-vm2" = "Linux VM 2"
    "n01725290-c-vm3" = "Linux VM 3"
  }
  admin_username        = var.admin_username
  admin_password        = var.admin_password
  availability_set_name = "n01725290-linux-aset"
  storage_account_uri   = "https://${module.common.storage_account_name}.blob.core.windows.net/"
}
module "windows_vm" {
  source                = "./modules/vmwindows-n01725290"
  location              = var.location
  rg_name               = module.rgroup.resource_group_name
  subnet_id             = module.network.subnet_id
  admin_username        = var.admin_username
  admin_password        = var.admin_password
  availability_set_name = "n01725290-windows-aset"
  storage_account_uri   = "https://${module.common.storage_account_name}.blob.core.windows.net/"
  vm_count              = 1
}
module "datadisks" {
  source   = "./modules/datadisk-n01725290"
  location = var.location
  rg_name  = module.rgroup.resource_group_name
  vm_ids   = concat(
  module.linux_vms.linux_vm_ids,
  module.windows_vm.windows_vm_ids
  )
}
module "loadbalancer" {
  source           = "./modules/loadbalancer-n01725290"
  location         = var.location
  rg_name          = module.rgroup.resource_group_name
  lb_name          = "n01725290-lb"
  linux_vm_nic_ids = module.linux_vms.linux_vm_nic_ids
}
module "database" {
  source          = "./modules/database-n01725290"
  location        = var.location
  rg_name         = module.rgroup.resource_group_name
  db_name         = "n01725290-pgsql"
  admin_username  = var.admin_username
  admin_password  = var.admin_password
}

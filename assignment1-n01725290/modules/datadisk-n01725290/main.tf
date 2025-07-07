resource "azurerm_managed_disk" "this" {
  count               = length(var.vm_ids) * 2
  name                = "datadisk-${count.index}"
  location            = var.location
  resource_group_name = var.rg_name
  storage_account_type = "Standard_LRS"
  create_option       = "Empty"
  disk_size_gb        = 10
}

resource "azurerm_virtual_machine_data_disk_attachment" "this" {
  count              = length(var.vm_ids) * 2
  managed_disk_id    = azurerm_managed_disk.this[count.index].id
  virtual_machine_id = element(var.vm_ids, floor(count.index / 4))
  lun                = count.index % 4
  caching            = "ReadWrite"
}

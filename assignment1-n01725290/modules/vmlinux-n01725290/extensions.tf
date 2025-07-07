resource "azurerm_virtual_machine_extension" "azure_monitor" {
  for_each = var.vm_names

  name                       = "AzureMonitorAgent-${each.key}"
  virtual_machine_id         = azurerm_linux_virtual_machine.this[each.key].id
  publisher                  = "Microsoft.Azure.Monitor"
  type                       = "AzureMonitorLinuxAgent"
  type_handler_version       = "1.0"
  auto_upgrade_minor_version = true
}

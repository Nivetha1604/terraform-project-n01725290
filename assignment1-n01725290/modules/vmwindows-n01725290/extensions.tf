resource "azurerm_virtual_machine_extension" "antimalware" {
  count                      = 1
  name                       = "IaaSAntimalware"
  virtual_machine_id         = azurerm_windows_virtual_machine.this[count.index].id
  publisher                  = "Microsoft.Azure.Security"
  type                       = "IaaSAntimalware"
  type_handler_version       = "1.5"
  auto_upgrade_minor_version = true
}

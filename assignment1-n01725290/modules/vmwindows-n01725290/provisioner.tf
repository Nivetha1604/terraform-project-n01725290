resource "azurerm_virtual_machine_extension" "windows_custom_script" {
  for_each = { for idx, vm in azurerm_windows_virtual_machine.this : idx => vm }

  name                 = "CustomScriptExtension"
  virtual_machine_id   = each.value.id
  publisher            = "Microsoft.Compute"
  type                 = "CustomScriptExtension"
  type_handler_version = "1.10"
  settings = <<SETTINGS
{
  "commandToExecute": "powershell.exe -Command \"Add-WindowsFeature -Name Web-Server\""
}
SETTINGS
}


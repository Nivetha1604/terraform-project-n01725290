resource "azurerm_virtual_machine_extension" "linux_custom_script" {
  for_each             = azurerm_linux_virtual_machine.this
  name                 = "CustomScript"
  virtual_machine_id   = each.value.id
  publisher            = "Microsoft.Azure.Extensions"
  type                 = "CustomScript"
  type_handler_version = "2.1"

  settings = jsonencode({
    commandToExecute = "sudo apt-get update && sudo apt-get install -y apache2"
  })
}
# provisioner logic already added inside azurerm_linux_virtual_machine in main.tf
# Provisioner logic is handled inline in main.tf for each VM

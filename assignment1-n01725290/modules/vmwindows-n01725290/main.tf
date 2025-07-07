resource "azurerm_availability_set" "this" {
  name                         = var.availability_set_name
  location                     = var.location
  resource_group_name          = var.rg_name
  platform_fault_domain_count  = 2
  platform_update_domain_count = 2
  managed                      = true
}

resource "azurerm_public_ip" "this" {
  count               = var.vm_count
  name                = "windows-pip-${count.index}"
  location            = var.location
  resource_group_name = var.rg_name
  allocation_method   = "Dynamic"
  domain_name_label   = lower("winvm-${count.index}-dns")
}

resource "azurerm_network_interface" "this" {
  count               = var.vm_count
  name                = "windows-nic-${count.index}"
  location            = var.location
  resource_group_name = var.rg_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.this[count.index].id
  }
}

resource "azurerm_windows_virtual_machine" "this" {
  count                 = var.vm_count
  name                  = "winvm-${count.index}"
  resource_group_name   = var.rg_name
  location              = var.location
  size                  = "Standard_D2s_v3"
  admin_username        = var.admin_username
  admin_password        = var.admin_password
  network_interface_ids = [azurerm_network_interface.this[count.index].id]
  availability_set_id   = azurerm_availability_set.this.id

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    name                 = "winvm-osdisk-${count.index}"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }

  boot_diagnostics {
    storage_account_uri = var.storage_account_uri
  }

  provision_vm_agent = true


}

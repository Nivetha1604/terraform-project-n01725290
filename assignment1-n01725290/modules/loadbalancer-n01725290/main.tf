resource "azurerm_public_ip" "this" {
  name                = "${var.lb_name}-pip"
  location            = var.location
  resource_group_name = var.rg_name
  allocation_method   = "Static"
  sku                 = "Basic"
}

resource "azurerm_lb" "this" {
  name                = var.lb_name
  location            = var.location
  resource_group_name = var.rg_name
  sku                 = "Basic"

  frontend_ip_configuration {
    name                 = "PublicFrontEnd"
    public_ip_address_id = azurerm_public_ip.this.id
  }
}

resource "azurerm_lb_backend_address_pool" "this" {
  name                = "BackendPool"
  resource_group_name = var.rg_name
  loadbalancer_id     = azurerm_lb.this.id
}

resource "azurerm_lb_probe" "this" {
  name                = "http-probe"
  resource_group_name = var.rg_name
  loadbalancer_id     = azurerm_lb.this.id
  protocol            = "Http"
  port                = 80
  request_path        = "/"
  interval_in_seconds = 5
  number_of_probes    = 2
}
resource "azurerm_lb_rule" "this" {
  name                           = "http-rule"
  resource_group_name            = var.rg_name
  loadbalancer_id                = azurerm_lb.this.id
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = "PublicFrontEnd"
  backend_address_pool_id        = azurerm_lb_backend_address_pool.this.id
  probe_id                       = azurerm_lb_probe.this.id
}

resource "azurerm_network_interface_backend_address_pool_association" "this" {
  count                   = length(var.linux_vm_nic_ids)
  network_interface_id    = var.linux_vm_nic_ids[count.index]
  ip_configuration_name   = "internal"
  backend_address_pool_id = azurerm_lb_backend_address_pool.this.id
}

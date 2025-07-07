output "vnet_name" {
  description = "The name of the virtual network"
  value       = azurerm_virtual_network.this.name
}

output "subnet_name" {
  description = "The name of the subnet"
  value       = azurerm_subnet.this.name
}
output "subnet_id" {
  description = "The ID of the subnet"
  value       = azurerm_subnet.this.id
}

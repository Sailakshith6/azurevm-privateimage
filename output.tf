output "resource_group_name" {
  description = "The name of the resource group."
  value       = azurerm_resource_group.example.name
}

output "virtual_machine_id" {
  description = "The ID of the created virtual machine."
  value       = azurerm_virtual_machine.example.id
}

output "network_interface_id" {
  description = "The ID of the network interface."
  value       = azurerm_network_interface.example.id
}

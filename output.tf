output "virtual_network_name" {
  description = "The name of the virtual network."
  value       = azurerm_virtual_network.example.name
}

output "subnet_id" {
  description = "The ID of the created subnet."
  value       = azurerm_subnet.example.id
}

output "vm_os_disk_id" {
  description = "The ID of the OS disk of the virtual machine."
  value       = azurerm_virtual_machine.example.storage_os_disk[0].id
}

output "public_ip_address" {
  description = "The public IP address of the virtual machine (if applicable)."
  value       = azurerm_public_ip.example.ip_address
  condition   = length(azurerm_public_ip.example.ip_address) > 0
}

output "private_ip_address" {
  description = "The private IP address of the virtual machine."
  value       = azurerm_network_interface.example.private_ip_address
}

output "image_id" {
  description = "The ID of the image used to create the virtual machine."
  value       = var.image_id
}

output "location" {
  description = "The location (region) where resources are created."
  value       = azurerm_resource_group.example.location
}

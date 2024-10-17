# main.tf
provider "azurerm" {
  features {}

  # Required properties for Azure authentication
  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
}

resource "azurerm_resource_group" "example" {
  name     = "aostemplate_group"
  location = "West US"
}

resource "azurerm_image" "example" {
  name                = var.image_name
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location

  storage_profile {
    os_disk {
      os_type           = "Linux"
      os_state         = "Generalized"
      managed_disk_type = "Premium_LRS"
    }
  }

  # Additional configurations for the image can be added here
}

resource "azurerm_virtual_machine" "example" {
  name                  = var.vm_name
  location              = azurerm_resource_group.example.location
  resource_group_name   = azurerm_resource_group.example.name
  network_interface_ids = [azurerm_network_interface.example.id]
  vm_size               = var.vm_size

  storage_os_disk {
    name              = "${var.vm_name}-osdisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Premium_LRS"
  }

  os_profile {
    computer_name  = var.vm_name
    admin_username = var.admin_username
    admin_password = var.admin_password
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }

  # Use the image_id variable for the source image
  source_image_id = var.image_id
}

# Add other necessary resources, such as network interfaces and security groups, as needed.

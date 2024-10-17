variable "vm_name" {
  description = "The name of the virtual machine."
  type        = string
  default     = "aostemplate"
}

variable "vm_size" {
  description = "The size of the virtual machine."
  type        = string
  default     = "Standard_B1ls"
}

variable "image_id" {
  description = "The resource ID of the private image."
  type        = string
  default     = "/subscriptions/680607b4-c642-4df6-856f-c593fe9c6a6c/resourceGroups/aostemplate_group/providers/Microsoft.Compute/images/aostemplate-image-20241017194443"
}

variable "admin_username" {
  description = "The admin username for the virtual machine."
  type        = string
  default     = "adminuser"
}

variable "admin_password" {
  description = "The admin password for the virtual machine."
  type        = string
  sensitive   = true
  default     = "P@ssword1234" # Use secure methods to handle passwords in production.
}

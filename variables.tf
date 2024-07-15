variable "resource_group_location" {
    type = string
    default = "eastus"
    description = "Location of the resource group."
}

variable "resource_group_name_prefix" {
    type = string
    default = "rg"
    description = "Prefix of the ressource group name"
}

variable "admin_username" {
  description = "Admin username for the VM"
  type        = string
  default     = "azureuser"
}

variable "admin_password" {
  description = "Admin password for the VM"
  type        = string
  sensitive   = true
}

variable "vm_size" {
  description = "Size of the VM"
  type        = string
  default     = "Standard_D2s_v3"
}

variable "ssh_private_key_path" {
  description = "Path to the private SSH key"
  type        = string
  default     = "~/.ssh/id_rsa"
}

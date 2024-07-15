resource "random_pet" "ssh_key_name" {
    prefix = "ssh"
    separator = ""
}

resource "azurerm_ssh_public_key" "ssh_public_key" {
  name                = random_pet.ssh_key_name.id
  location            = var.resource_group_location
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_ssh_public_key" "ssh_key" {
  name                = "${random_pet.ssh_key_name.id}-key"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.resource_group_location
  key_data            = file("${var.ssh_private_key_path}.pub")
}

output "key_data" {
  value = azurerm_ssh_public_key.ssh_key.public_key
}

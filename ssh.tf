resource "random_pet" "ssh_key_name" {
    prefix = "ssh"
    separator = ""
}

resource "azapi_resource_action" "ssh_public_key_gen" {
    type = ""
    resource_id = azapi_resource.ssh_public_key.id
    action = "GenerateKeyPair"
    method = "POST"

    response_export_values = ["PublicKey", "privateKey"]
}

resource "azapi_resource" "ssh_public_key" {
    type = "Microsoft.Compute/ssh"
    resource_id = 
    action =
    method =

    response_export_values = ["PublicKey", "privateKey"]
}

output "key_data" {
    value = jsondecode(azapi_resource_action.ssh_public_key_gen.output).publicKey
}
output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

output "virtual_network_name" {
  value = azurerm_virtual_network.vnet.name
}

output "vm_id" {
  value = module.linux_vm.vm_id
}

output "public_ip" {
  value = var.enable_public_ip ? azurerm_public_ip.pip[0].ip_address : "No Public IP"

  sensitive = true
}

data "azurerm_image" "hashistack" {
  name                = "oslohug-hashistack2"
  resource_group_name = "oslohug-images"
}

module "vm01" {
  source              = "./modules/virtual-machine"
  prefix              = "${local.prefix}vm01"
  resource_group_name = "${azurerm_resource_group.main.name}"
  location            = "${azurerm_resource_group.main.location}"
  subnet_id           = "${module.network.subnet_id}"
  image_id            = "${data.azurerm_image.hashistack.id}"
  username            = "${local.username}"
  public_ssh_key      = "${local.ssh_key}"
  vm_size             = "Standard_F2"
  tags                = "${local.tags}"
}

output "public_ips" {
  value = [
    "${module.vm01.public_ip_address}",
  ]
}

resource "azurerm_resource_group" "main" {
  name     = "${local.prefix}-resources"
  location = "West Europe"
  tags     = "${local.tags}"
}

module "network" {
  source              = "./modules/network"
  prefix              = "${local.prefix}"
  resource_group_name = "${azurerm_resource_group.main.name}"
  location            = "${azurerm_resource_group.main.location}"
  tags                = "${local.tags}"
}

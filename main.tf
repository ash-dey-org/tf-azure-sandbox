data "azurerm_resource_group" "rg" {
  name = "${var.env}-${var.region}-${var.company}-rg-${var.proj}"
}

data "azurerm_virtual_network" "vnet" {
  name                = "sandbox-vnet-delete"
  resource_group_name = data.azurerm_resource_group.rg.name
}

data "azurerm_client_config" "current" {}


locals {
  create_network = lookup({
    dev = true
    tst = var.deploy_env == "tst" ? false : true
    uat = var.deploy_env == "uat" ? false : true
    prd = true
    },
  var.deploy_env, false)
}

# lookup(map, key, default)

resource "azurerm_subnet" "endpoint-subnet" {
  count                = local.create_network ? 1 : 0
  name                 = "vsad-${var.deploy_env}-${var.proj}-pe-subnet"
  resource_group_name  = data.azurerm_resource_group.rg.name
  virtual_network_name = data.azurerm_virtual_network.vnet.name
  address_prefixes     = var.sn_address_space
}




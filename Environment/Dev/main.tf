module "azurerm_resource_group" {
  source = "../../modules/azurerm_resource_group"
   resource_groups = var.RGs
}

module "azurerm_vnet" {
    depends_on = [module.azurerm_resource_group]
  source = "../../modules/azurerm_vnet"
  virtual_networks = var.Vnets
}

module "azurerm_subnet" {
    depends_on = [module.azurerm_vnet]
  source = "../../modules/azurerm_subnet"
  subnets = var.Subnets
}
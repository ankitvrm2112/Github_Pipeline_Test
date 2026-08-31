RGs = {
  RG2 = {
    name     = "Dev-2"
    location = "eastus"
  }
  RG1 = {
    name     = "Dev-1"
    location = "centralindia"
  }
}

Vnets = {
  vnet2 = {
    name                = "Dev-Vnet-2"
    address_space       = ["10.144.0.0/16"]
    location            = "eastus"
    resource_group_name = "Dev-2"
  }
  vnet1 = {
    name                = "Dev-Vnet-1"
    address_space       = ["10.143.0.0/16"]
    location            = "centralindia"
    resource_group_name = "Dev-1"
  }
}

Subnets = {
  subnet2 = {
    name                 = "Dev-Subnet-2"
    resource_group_name  = "Dev-2"
    virtual_network_name = "Dev-Vnet-2"
    address_prefixes     = ["10.144.1.0/24"]
  }
  subnet1 = {
    name                 = "Dev-Subnet-1"
    resource_group_name  = "Dev-1"
    virtual_network_name = "Dev-Vnet-1"
    address_prefixes     = ["10.143.1.0/24"]
  }
}

RGs = {
  RG2 = {
    name     = "Sunita-RG"
    location = "South India"
  }
  RG3 = {
    name     = "Test-RG"
    location = "Central India"
  }
  RG1 = {
    name     = "Prod-RG"
    location = "Central India"
  }
}

Vnets = {
  vnet3 = {
    name                = "Test-Vnet"
    address_space       = ["172.0.0.0/16"]
    location            = "Central India"
    resource_group_name = "Test-RG"
  }
  vnet1 = {
    name                = "Prod-Vnet"
    address_space       = ["10.23.0.0/16"]
    location            = "Central India"
    resource_group_name = "Prod-RG"
  }
  vnet2 = {
    name                = "Sunita-Vnet"
    address_space       = ["10.234.0.0/16"]
    location            = "South India"
    resource_group_name = "Sunita-RG"
  }
}

Subnets = {
  subnet1 = {
    name                 = "Prod-Subnet-1"
    resource_group_name  = "Prod-RG"
    virtual_network_name = "Prod-Vnet"
    address_prefixes     = ["10.23.1.0/24"]
  }
  subnet3 = {
    name                 = "Test-Subnet"
    resource_group_name  = "Test-RG"
    virtual_network_name = "Test-Vnet"
    address_prefixes     = ["172.0.1.0/24"]
  }
  subnet2 = {
    name                 = "Sunita-Subnet"
    resource_group_name  = "Sunita-RG"
    virtual_network_name = "Sunita-Vnet"
    address_prefixes     = ["10.234.1.0/24"]
  }
}

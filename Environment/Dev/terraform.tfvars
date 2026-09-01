RGs = {
  RG1 = {
    name     = "Prod-RG"
    location = "Central India"
  }
  RG4 = {
    name     = "Test-1"
    location = "Central India"
  }
  RG3 = {
    name     = "Dev-1-RG"
    location = "Central India"
  }
  RG2 = {
    name     = "Prod1-RG"
    location = "South India"
  }
}

Vnets = {
  vnet4 = {
    name                = "Test-Vnet"
    address_space       = ["10.0.0.0/16"]
    location            = "Central India"
    resource_group_name = "Test-1"
  }
  vnet2 = {
    name                = "Prod1-Vnet"
    address_space       = ["10.24.0.0/16"]
    location            = "South India"
    resource_group_name = "Prod1-RG"
  }
  vnet3 = {
    name                = "Dev-1-Vnet23"
    address_space       = ["10.143.0.0/16"]
    location            = "Central India"
    resource_group_name = "Dev-1-RG"
  }
  vnet1 = {
    name                = "Prod-Vnet"
    address_space       = ["10.23.0.0/16"]
    location            = "Central India"
    resource_group_name = "Prod-RG"
  }
}

Subnets = {
  subnet2 = {
    name                 = "Prod-Subnet-2"
    resource_group_name  = "Prod1-RG"
    virtual_network_name = "Prod1-Vnet"
    address_prefixes     = ["10.24.1.0/24"]
  }
  subnet3 = {
    name                 = "Dev-1-Subnet23"
    resource_group_name  = "Dev-1-RG"
    virtual_network_name = "Dev-1-Vnet23"
    address_prefixes     = ["10.143.1.0/24"]
  }
  subnet1 = {
    name                 = "Prod-Subnet-1"
    resource_group_name  = "Prod-RG"
    virtual_network_name = "Prod-Vnet"
    address_prefixes     = ["10.23.1.0/24"]
  }
  subnet4 = {
    name                 = "Test-Subnet"
    resource_group_name  = "Test-1"
    virtual_network_name = "Test-Vnet"
    address_prefixes     = ["10.0.1.0/24"]
  }
}

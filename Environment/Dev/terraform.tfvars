RGs = {
        RG1 = {
        name     = "Dev-1"
        location = "centralindia"
        }
        RG2 = {
        name     = "Dev-2"
        location = "southindia"
        }
    }

Vnets = {
        vnet1 = {
            name                 = "Dev-Vnet-1"
             address_space        = ["10.143.0.0/16"]
             location             = "centralindia"
            resource_group_name  = "Dev-1"
        }
    }

Subnets = {
        subnet1 = {
            name                 = "Dev-Subnet-1"
            resource_group_name  = "Dev-1"
            virtual_network_name = "Dev-Vnet-1"
            address_prefixes     = ["10.143.1.0/24"]
        }
        subnet2 = {
            name                 = "Dev-Subnet-2"
            resource_group_name  = "Dev-1"
            virtual_network_name = "Dev-Vnet-1"
            address_prefixes     = ["10.143.2.0/24"]
        }
}
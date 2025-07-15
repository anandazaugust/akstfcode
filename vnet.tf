resource "azurerm_virtual_network" "example" {
  name                = "aksvnet"
  location            = "eastus"
  resource_group_name = "testrg"
  address_space       = ["10.40.0.0/16"]




  subnet {
    name             = "subnet1"
    address_prefixes = ["10.40.1.0/24"]
  }
  tags = {
    a = "b"
  }
}
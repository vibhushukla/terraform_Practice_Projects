resource "azurerm_virtual_network" "example" {
  name                = "example-network"
  location            = "East us"
  resource_group_name = "importResorceGroup"
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "example" {
  name                 = "example-subnet"
  resource_group_name  = "importResorceGroup"
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = ["10.0.1.0/24"]
}

output "vnet_id" {
  value = azurerm_virtual_network.example.id
}

output "subnet_id" {
  value = azurerm_subnet.example.id
}
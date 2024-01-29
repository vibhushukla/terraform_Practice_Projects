

resource "azurerm_network_security_group" "example" {
  name                = "example-security-group"
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
}

data "azurerm_resource_group" "rg" {
  name = "appservice-demo"
}

resource "azurerm_resource_group" "example" {
  name     = "acceptanceTestResourceGroup1"
  location = "West US"
}

variable "sg" {
    # type = list(object({
    #     name = string
    #     priority = string
    #     port = string
    # }))
  
}

resource "azurerm_network_security_group" "example" {
  name                = "acceptanceTestSecurityGroup1"
  location            = "${azurerm_resource_group.example.location}"
  resource_group_name = "${azurerm_resource_group.example.name}"

  dynamic "security_rule" {
    for_each = var.sg
    content {
    name                       = security_rule.value.name
    priority                   = security_rule.value.priority
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = security_rule.value.port
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
    
  }


  tags = {
    environment = "Production"
  }
}

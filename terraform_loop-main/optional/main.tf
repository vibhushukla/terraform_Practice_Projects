variable "subnets" {
  default = null
  type = map(object({
    name           = string
    address_prefix = string
    security_group = optional(string)
  }))
}

resource "azurerm_virtual_network" "vent" {
  name                = "example-network"
  location            = "West Europe"
  resource_group_name = "example-resources"
  address_space       = ["10.0.0.0/16"]

  dynamic "subnet" {
    for_each = var.subnets != null ? var.subnets : {}
    content {
      name           = subnet.value.name
      address_prefix = subnet.value.address_prefix
      security_group = subnet.value.security_group
    }
  }
}

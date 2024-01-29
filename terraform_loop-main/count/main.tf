data "azurerm_resource_group" "rg" {
  name = "appservice-demo"
}

variable "create_resource" {
    type = bool
    default = false
}

resource "azurerm_storage_account" "example" {
  count                    = var.create_resource ? 1 : 0
  name                     = "storageaccountname"
  resource_group_name      = data.azurerm_resource_group.rg.name
  location                 = data.azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
}
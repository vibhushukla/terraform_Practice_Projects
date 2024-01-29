resource "azurerm_resource_group" "rg" {
  name     = "rg1"
  location = "West Europe"
}

resource "azurerm_storage_account" "SA" {
    count = var.enable_storage ? 1 :0
  name                     = "storageaccountname1"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
}
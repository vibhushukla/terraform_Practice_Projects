# terraform import azurerm_resource_group.rg /subscriptions/af95985f-fb7d-44e1-94a9-435eaa0d089d/resourceGroups/importResorceGroup
# terraform import azurerm_resource_group.rg /subscriptions/af95985f-fb7d-44e1-94a9-435eaa0d089d/resourceGroups/importResorceGroup


# terraform import azurerm_resource_group.example /subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/group1

resource "azurerm_resource_group" "rg" {
    location = "eastus"
    name     = "importResorceGroup"
    tags     = {}
}
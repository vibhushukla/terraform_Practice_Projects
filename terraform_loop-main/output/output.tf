variable "resource_groups" {
  type = map(string)
  default = {
    "RG1" = "eastus"
    "RG2" = "westus"
    "RG3" = "centralus"
  }
}


resource "azurerm_resource_group" "rg" {
  for_each = var.resource_groups

  name     = each.key
  location = each.value
}


output "rg_ids" {
  value = { for k, v in azurerm_resource_group.rg : k => v.id }
}

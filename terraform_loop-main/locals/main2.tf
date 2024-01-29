locals {
  rg_prefix = "rg-devopsinsiders-"
  tags = {
    environment = "Terraform Demo",
    managed_by = "Terraform"
  }
}

resource "azurerm_resource_group" "myterraformgroup" {
    for_each = var.rg_names
    name     = "${local.rg_prefix}${each.value.name}"
    location = each.value.location //= location = "${each.value.location}"
    
    tags = local.tags
}

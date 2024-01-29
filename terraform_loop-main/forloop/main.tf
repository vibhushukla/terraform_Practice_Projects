variable "storage" {
  # type = map(object({
  #     name = string
  #     tier = string
  #     replica = string
  # }))
}

module "storage_account" {
  source                   = "github.com/Anshuman2121/azure_modules_example.git//storage"
  for_each                 = var.storage
  storage_account_name     = each.value.name
  account_tier             = each.value.tier
  account_replication_type = each.value.replica
}

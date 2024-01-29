module "vnet_and_subnet" {
  source = "../Module/vnet"
}

output "vnetid" {
  value = module.vnet_and_subnet.vnet_id
}
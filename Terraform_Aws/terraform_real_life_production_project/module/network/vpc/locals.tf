locals {
  common_tags = merge(
    {
      Managed = "temgvan"
      Module = "network"
    },
    var.tags 
  )

  nat_gateway_count = var.enable_nat_gateway ? (var.single_nat_gateway ? 1 : length(var.azs)) : 0
}
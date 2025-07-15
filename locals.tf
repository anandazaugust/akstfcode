locals {
  test3 = flatten([for a, b in var.aks_clusters : [
    for c, d in b.additional_node_pools : merge(d, {
      aks_name = a
      test     = "a"
      }
  )]])

  test4 = { for a, b in local.test3 : b.aks_name => b }

}

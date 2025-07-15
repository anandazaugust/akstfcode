# output "aks1" {
#   value = for cluster_name, cluster in var.aks_clusters : { for c, d in cluster.additional_node_pools: c => d } if cluster.additional_node_pools != null ]
# }

# output "aks1" {
#   value = {for cluster_name, cluster in var.aks_clusters :{ for c, d in cluster.additional_node_pools: c => d}}
# }

output "test" {
  value = local.test3
}
output "test4" {
  value = local.test4
}

output "test6" {
  value = local.test4
}
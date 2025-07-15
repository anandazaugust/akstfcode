resource "azurerm_kubernetes_cluster_node_pool" "additional_node_pools" {

  kubernetes_cluster_id = var.kubernetes_cluster_id
  name                  = var.name
  node_count            = var.node_count
  vm_size               = var.vm_size
  os_sku                = var.os_sku
  vnet_subnet_id        = var.vnet_subnet_id
  mode                  = var.mode
  # auto_scaling_enabled = {
  #   enabled   = var.auto_scaling_enabled
  #   min_count = var.min_count
  #   max_count = var.max_count

  # }
  auto_scaling_enabled = var.auto_scaling_enabled
  min_count            = var.auto_scaling_enabled ? var.min_count : null
  max_count            = var.auto_scaling_enabled ? var.max_count : null
}
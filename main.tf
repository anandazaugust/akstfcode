module "aks" {
  source   = "./modules/aks"
  for_each = var.aks_clusters

  aks_name                               = each.value.aks_name
  location                               = each.value.location
  rg_name                                = each.value.rg_name
  dns_prefix                             = each.value.dns_prefix
  default_node_pool_name                 = each.value.default_node_pool.name
  default_node_count                     = each.value.default_node_pool.node_count
  default_node_pool_vm_size              = each.value.default_node_pool.vm_size
  default_node_pool_os_sku               = each.value.default_node_pool.os_sku
  default_node_pool_auto_scaling_enabled = each.value.default_node_pool.auto_scaling_enabled
  network_mode                           = each.value.network_profile.network_mode
  network_plugin_mode                    = each.value.network_profile.network_plugin_mode
  service_cidr                           = each.value.network_profile.service_cidr
  dns_service_ip                         = each.value.network_profile.dns_service_ip
  network_plugin                         = each.value.network_profile.network_plugin
  default_node_pool_vnet_subnet_id       = each.value.default_node_pool.vnet_subnet_id
  pod_cidr                               = each.value.network_profile.pod_cidr
  node_os_upgrade_channel                = each.value.node_os_upgrade_channel
  automatic_upgrade_channel              = each.value.automatic_upgrade_channel
  role_based_access_control_enabled      = each.value.role_based_access_control_enabled
  local_account_disabled                 = each.value.local_account_disabled
  oidc_issuer_enabled                    = each.value.oidc_issuer_enabled
  default_nginx_controller = try( each.value.web_app_routing.default_nginx_controller, null)


  workload_identity_enabled                        = each.value.workload_identity_enabled
  azure_active_directory_role_based_access_control = each.value.azure_active_directory_role_based_access_control

  azure_rbac_enabled              = try(each.value.azure_active_directory_role_based_access_control.azure_rbac_enabled, false)
  azure_ad_admin_group_object_ids = try(each.value.azure_active_directory_role_based_access_control.azure_ad_admin_group_object_ids, [])
  tenant_id                       = try(each.value.azure_active_directory_role_based_access_control.tenant_id, null)



  identity_type               = each.value.identity_type
  rg_name_node                = each.value.rg_name_node
  default_node_pool_max_count = each.value.default_node_pool.max_count
  default_node_pool_min_count = each.value.default_node_pool.min_count
  web_app_routing = each.value.web_app_routing 
}

module "nodepool" {
  source   = "./modules/nodepool"
  for_each = local.test4

  kubernetes_cluster_id = module.aks[each.key].kubernetes_cluster_id
  name                  = each.value.name
  node_count            = each.value.node_count
  vm_size               = each.value.vm_size
  os_sku                = each.value.os_sku
  vnet_subnet_id        = each.value.vnet_subnet_id
  mode                  = each.value.mode
  auto_scaling_enabled  = each.value.auto_scaling_enabled
  min_count             = each.value.min_count
  max_count             = each.value.max_count
}
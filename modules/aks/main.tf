resource "azurerm_kubernetes_cluster" "example" {
  name                      = var.aks_name
  location                  = var.location
  resource_group_name       = var.rg_name
  dns_prefix                = var.dns_prefix
  node_os_upgrade_channel   = var.node_os_upgrade_channel
  automatic_upgrade_channel = var.automatic_upgrade_channel
  # role_based_access_control_enabled = var.azure_rbac_enabled ? false : var.role_based_access_control_enabled
  role_based_access_control_enabled = var.role_based_access_control_enabled
  local_account_disabled            = var.local_account_disabled
  node_resource_group               = var.rg_name_node
  oidc_issuer_enabled               = var.oidc_issuer_enabled
  workload_identity_enabled         = var.workload_identity_enabled
  dynamic "web_app_routing" {
    for_each = var.web_app_routing != null ? [1] : []
    content {
    default_nginx_controller = var.default_nginx_controller
    dns_zone_ids = []
  }
  }


  dynamic "azure_active_directory_role_based_access_control" {
    for_each = var.azure_active_directory_role_based_access_control != null ? [var.azure_active_directory_role_based_access_control] : []
    content {
      azure_rbac_enabled     = var.azure_rbac_enabled
      admin_group_object_ids = var.azure_ad_admin_group_object_ids
      tenant_id              = var.tenant_id
    }

  }



  network_profile {
    network_mode        = var.network_mode
    network_plugin      = var.network_plugin
    network_plugin_mode = var.network_plugin_mode
    service_cidr        = var.service_cidr
    dns_service_ip      = var.dns_service_ip
    pod_cidr            = var.network_plugin_mode == "overlay" ? var.pod_cidr : null

  }


  default_node_pool {
    name                 = var.default_node_pool_name
    node_count           = var.default_node_count
    vm_size              = var.default_node_pool_vm_size
    os_sku               = var.default_node_pool_os_sku
    vnet_subnet_id       = var.default_node_pool_vnet_subnet_id
    auto_scaling_enabled = var.default_node_pool_auto_scaling_enabled
    max_count            = var.default_node_pool_auto_scaling_enabled ? var.default_node_pool_max_count : null
    min_count            = var.default_node_pool_auto_scaling_enabled ? var.default_node_pool_min_count : null
  }


  identity {
    type = var.identity_type
  }

  tags = {
    Environment = "Production"
  }
  lifecycle {
    ignore_changes = [default_node_pool[0].upgrade_settings, default_node_pool[0].node_count]
  }
}


# aks_clusters = {
#   cluster1 = {
#     aks_name                          = "aks-cluster-1"
#     location                          = "eastus"
#     rg_name                           = "testrg"
#     dns_prefix                        = "aks1"
#     node_os_upgrade_channel           = "None"
#     local_account_disabled            = false
#     role_based_access_control_enabled = true
#     azure_active_directory_role_based_access_control = {
#       azure_rbac_enabled = true
#       #   azure_ad_admin_group_object_ids = ["301c664f-de8b-4d19-8403-0c68fc261ec1"]
#       tenant_id = "17a09c66-f406-4897-8b24-51f5313623dc"
#     }
#     node_count                = 1
#     oidc_issuer_enabled       = true
#     workload_identity_enabled = true
#     # web_app_routing = {
#     # #   default_nginx_controller = "Internal"
#     # #   dns_zone_ids             = []
#     # }
#     default_node_pool = {
#       name                 = "nodepool1"
#       node_count           = 1
#       vm_size              = "standard_B2s"
#       os_sku               = "Ubuntu"
#       auto_scaling_enabled = true
#       max_count            = 2
#       min_count            = 1

#       vnet_subnet_id = "/subscriptions/f90d25ee-e9c6-48de-be92-4639b8ffe74d/resourceGroups/testrg/providers/Microsoft.Network/virtualNetworks/aksvnet/subnets/subnet1"
#     }
#     network_profile = {
#       network_mode = "transparent"
#       # network_plugin_mode = "overlay"
#       service_cidr   = "10.10.0.0/16"
#       dns_service_ip = "10.10.0.10"
#       network_plugin = "azure"
#       pod_cidr       = "10.190.0.0/16"
#     }
#     identity_type = "SystemAssigned"

#   }


# }




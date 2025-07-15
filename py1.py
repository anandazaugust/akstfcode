count = 20

with open("aks_clusters.tfvars", "w") as f:
    f.write("aks_clusters = {\n")
    for i in range(1, count + 1):
        f.write(f"""  cluster{i} = {{
    aks_name                          = "aks-cluster-{i}"
    location                          = "eastus"
    rg_name                           = "testrg"
    dns_prefix                        = "aks{i}"
    node_os_upgrade_channel           = "None"
    local_account_disabled            = false
    role_based_access_control_enabled = true
    azure_active_directory_role_based_access_control = {{
      azure_rbac_enabled = true
      tenant_id = "17a09c66-f406-4897-8b24-51f5313623dc"
    }}
    node_count = 1
    default_node_pool = {{
      name       = "nodepool1"
      node_count = 1
      vm_size    = "Standard_A2_v2"
      os_sku     = "Ubuntu"
      vnet_subnet_id = "/subscriptions/f90d25ee-e9c6-48de-be92-4639b8ffe74d/resourceGroups/testrg/providers/Microsoft.Network/virtualNetworks/aksvnet/subnets/subnet1"
    }}
    network_profile = {{
      network_mode    = "transparent"
      service_cidr    = "10.10.0.0/16"
      dns_service_ip  = "10.10.0.10"
      network_plugin  = "azure"
      pod_cidr        = "10.190.0.0/16"
    }}
    identity_type = "SystemAssigned"
  }}\n""")
    f.write("}\n")

variable "aks_clusters" {
  description = "A map of AKS cluster configurations. If empty, no AKS clusters will be created."
  type = map(object({
    aks_name                          = string
    location                          = string
    rg_name                           = string
    dns_prefix                        = string
    local_account_disabled            = optional(bool, false) # Default to false if not specified
    rg_name_node                      = optional(string)      # Resource group for the AKS node pool
    role_based_access_control_enabled = optional(bool, false) # Default to true if not specified
    oidc_issuer_enabled               = optional(bool, false) # Default to false if not specified
    web_app_routing                   = optional(object({
      default_nginx_controller = optional(string) # Default to false if not specified
      dns_zone_ids             = optional(list(string), []) # Default to empty list if not specified
    }), null)
    workload_identity_enabled         = optional(bool, false) # Default to false if not specified
    default_node_pool = object({
      name                 = string
      node_count           = number
      vm_size              = string
      os_sku               = string
      vnet_subnet_id       = optional(string)      # Optional field for vnet subnet ID
      auto_scaling_enabled = optional(bool, false) # Default to false if not specified
      max_count            = optional(number, 2)   # Default to 3 if not specified
      min_count            = optional(number, 1)   # Default to 1 if not specified  
    })
    network_profile = object({
      network_mode        = string
      network_plugin_mode = optional(string)
      service_cidr        = string
      dns_service_ip      = string
      network_plugin      = optional(string, "azure") # Default to "azure" if not specified
      pod_cidr            = optional(string)
    })
    azure_active_directory_role_based_access_control = optional(object({
      azure_rbac_enabled              = optional(bool, false)      # Default to true if not specified
      azure_ad_admin_group_object_ids = optional(list(string), []) # Default to empty list if not specified
      tenant_id                       = optional(string, null)     # Default to null if not specified
    }))
    identity_type             = string
    node_os_upgrade_channel   = optional(string) # Added missing variable for node OS channel upgrade
    automatic_upgrade_channel = optional(string) # Default to "None" if not specified
    additional_node_pools = optional(map(object({
      name                 = string
      node_count           = number
      vm_size              = string
      os_sku               = string
      vnet_subnet_id       = string
      mode                 = string
      auto_scaling_enabled = optional(bool, false) # Default to false if not specified
      min_count            = optional(number)      # Default to 1 if not specified    
      max_count            = optional(number)      # Default to 3 if not specified
    })), {})
    })
  )
  default = {}
}

variable "subscription_id" {
  description = "The Azure subscription ID."
  type        = string
}

variable "client_id" {
  description = "The Azure client ID (application ID)."
  type        = string
}

variable "tenant_id" {
  description = "The Azure tenant ID."
  type        = string
}

variable "client_secret" {
  description = "The Azure client secret."
  type        = string
}
variable "aks_name" {
  description = "The name of the AKS cluster."
  type        = string
}

variable "location" {
  description = "The location/region where the AKS cluster will be created."
  type        = string
}

variable "rg_name" {
  description = "The name of the resource group."
  type        = string
}

variable "dns_prefix" {
  description = "The DNS prefix for the AKS cluster."
  type        = string
}

variable "node_os_upgrade_channel" {
  description = "The OS upgrade channel setting for the nodes in the AKS cluster."
  type        = string
}

variable "automatic_upgrade_channel" {
  description = "The automatic upgrade channel setting for the AKS cluster."
  type        = string
}

variable "network_mode" {
  description = "The network mode for the AKS cluster (e.g., 'transparent')."
  type        = string
}

variable "network_plugin" {
  description = "The network plugin for the AKS cluster (e.g., 'azure')."
  type        = string
}

variable "network_plugin_mode" {
  description = "The network plugin mode for the AKS cluster (e.g., 'kubenet' or 'azure')."
  type        = string
}

variable "service_cidr" {
  description = "The CIDR for the Kubernetes service network."
  type        = string
}

variable "dns_service_ip" {
  description = "The IP address for the Kubernetes DNS service."
  type        = string
}

variable "pod_cidr" {
  description = "The CIDR for the Kubernetes pod network."
  type        = string
}

variable "default_node_pool_name" {
  description = "The name of the default node pool."
  type        = string
}

variable "default_node_count" {
  description = "The number of nodes in the default node pool."
  type        = number
}

variable "default_node_pool_vm_size" {
  description = "The size of the virtual machines in the default node pool."
  type        = string
}

variable "default_node_pool_os_sku" {
  description = "The OS SKU for the default node pool (e.g., Ubuntu)."
  type        = string
}

variable "default_node_pool_vnet_subnet_id" {
  description = "The ID of the subnet where the AKS cluster's default node pool will be deployed."
  type        = string
}

variable "identity_type" {
  description = "The type of identity used for the AKS cluster (e.g., SystemAssigned or UserAssigned)."
  type        = string
}

variable "rg_name_node" {
  description = "The name of the resource group for the AKS node resources."
  type        = string

}

variable "role_based_access_control_enabled" {
  description = "Flag to enable or disable role-based access control (RBAC) for the AKS cluster."
  type        = bool

}

variable "azure_rbac_enabled" {
  type        = string
  description = "Flag to enable or disable role-based access control (RBAC) for the AKS cluster."
}

variable "azure_ad_admin_group_object_ids" {
  type        = list(string)
  description = "List of Azure AD group object IDs that will have admin access to the AKS cluster."
}

variable "tenant_id" {
  description = "The Azure tenant ID."
  type        = string

}

variable "azure_active_directory_role_based_access_control" {
  # type = string

}


variable "local_account_disabled" {
  type        = string
  description = "value for local_account_disabled"

}

variable "oidc_issuer_enabled" {
  type        = string
  description = "(optional) describe your variable"
}

variable "workload_identity_enabled" {
  type        = string
  description = "(optional) describe your variable"
}

variable "default_node_pool_auto_scaling_enabled" {
  type        = bool
  description = "Flag to enable or disable auto-scaling for the default node pool."
}

variable "default_node_pool_max_count" {
  type        = number
  description = "Maximum number of nodes for the default node pool when auto-scaling is enabled."
}

variable "default_node_pool_min_count" {
  type        = number
  description = "Minimum number of nodes for the default node pool when auto-scaling is enabled."
}

variable "default_nginx_controller" {
  type        = string
  description = "Flag to enable or disable the default NGINX controller for web app routing."
  
}

variable "web_app_routing" {
  # type = string
  description = "Configuration for web app routing, including default NGINX controller and DNS zone IDs."

  
}
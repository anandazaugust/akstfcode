variable "kubernetes_cluster_id" {
  description = "The ID of the Kubernetes cluster to which the node pool belongs."
  type        = string
}

variable "name" {
  description = "The name of the node pool."
  type        = string
}

variable "node_count" {
  description = "The number of nodes in the node pool."
  type        = number
}

variable "vm_size" {
  description = "The size of the virtual machines in the node pool."
  type        = string
}

variable "os_sku" {
  description = "The OS SKU for the node pool (e.g., Ubuntu)."
  type        = string
}

variable "vnet_subnet_id" {
  description = "The ID of the subnet where the node pool will be deployed."
  type        = string
}

variable "mode" {
  description = "The mode of the node pool (e.g., System or User)."
  type        = string
}

variable "auto_scaling_enabled" {
  description = "Enable or disable auto-scaling for the node pool."
  type        = bool

}

variable "min_count" {
  description = "The minimum number of nodes for auto-scaling."
  type        = number

}

variable "max_count" {
  description = "The maximum number of nodes for auto-scaling."
  type        = number

}
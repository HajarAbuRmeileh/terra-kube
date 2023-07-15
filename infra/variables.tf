variable "resource_group_location" {
  type        = string
  default     = "eastus"
  description = "Location of the resource group."
}
variable "resource_group_name" {
  type        = string
  default     = "hajarhello"
  description = "name of the resource group."
}
variable "azurerm_kubernetes_cluster_name" {
  type        = string
  default     = "helloppucluster"
  description = "name of the cluster."
}

variable "node_count" {
  type        = number
  description = "The initial quantity of nodes for the node pool."
  default     = 1
}

variable "msi_id" {
  type        = string
  description = "The Managed Service Identity ID. Set this value if you're running this example using Managed Identity as the authentication method."
  default     = null
}
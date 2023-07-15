

resource "azurerm_resource_group" "example" {
  location = var.resource_group_location
  name     = var.resource_group_name
}


resource "azurerm_kubernetes_cluster" "example" {
  location            = var.resource_group_location
  name                = var.azurerm_kubernetes_cluster_name
  resource_group_name = var.resource_group_name
  dns_prefix          = "my"

  identity {
    type = "SystemAssigned"
  }

  default_node_pool {
    name       = "agentpool"
    vm_size    = "Standard_D2_v2"
    node_count = var.node_count
  }
  linux_profile {
    admin_username = "ubuntu"

    ssh_key {
      key_data = jsondecode(azapi_resource_action.ssh_public_key_gen.output).publicKey
    }
  }
  network_profile {
    network_plugin    = "kubenet"
    load_balancer_sku = "standard"
  }
}




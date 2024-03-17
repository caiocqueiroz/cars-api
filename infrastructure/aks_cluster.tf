resource "azurerm_resource_group" "rg" {
  name     = "rg-${var.cluster_name}"
  location = var.resource_group_location
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.cluster_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = var.dns_prefix


  default_node_pool {
    name       = "npprimoti"
    vm_size    = "Standard_D2_v2"
    node_count = 2
    enable_auto_scaling = true
    min_count = 1
    max_count = 5
  }

  # identity {
  #   type = "SystemAssigned"
  # }

  network_profile {
    network_plugin = "kubenet"
    load_balancer_sku = "standard"
  }
  
  service_principal {
    client_id     = var.aks_service_principal_app_id
    client_secret = var.aks_service_principal_client_secret
  }

    linux_profile {
    admin_username = var.admin_username

    ssh_key {
      key_data = jsondecode(azapi_resource_action.ssh_public_key_gen.output).publicKey
    }
  }


  tags = {
    Environment = "Terraform AKS"
  }
}

resource "azurerm_role_assignment" "acr_pull" {
  scope                = azurerm_container_registry.acr.id
  role_definition_name = "AcrPull"
  principal_id         = azurerm_kubernetes_cluster.aks.kubelet_identity[0].object_id
}
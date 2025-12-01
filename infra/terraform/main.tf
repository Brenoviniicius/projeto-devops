resource "azurerm_resource_group" "rg" {
  name = var.resource_group
  location = var.location
  tags = local.tags
}

resource "azurerm_container_registry" "acr" {
  name = var.acr_name
  resource_group_name = azurerm_resource_group.rg.name
  location = azurerm_resource_group.rg.location
  sku = "Standard"
  admin_enabled = false
  tags = local.tags
}

resource "azurerm_kubernetes_cluster" "aks" {
  name = var.aks_name
  location = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix = var.dns_prefix

  default_node_pool {
    name = "system"
    node_count = var.node_count
    vm_size = var.vm_size
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin = "azure"
    load_balancer_sku = "standard"
  }

  tags = local.tags
}

resource "azurerm_role_assignment" "aks_acr_pull" {
  scope = azurerm_container_registry.acr.id
  role_definition_name = "AcrPull"
  principal_id = azurerm_kubernetes_cluster.aks.identity[0].principal_id
}


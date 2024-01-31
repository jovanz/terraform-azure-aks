resource "azurerm_kubernetes_cluster_node_pool" "main" {
  name                  = "nodepool1"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.main.id

  node_count           = 3
  vm_size              = "Standard_B2s"
  zones                = ["1", "2"]
  enable_auto_scaling  = false
  os_disk_size_gb      = 30
  os_disk_type         = "Ephemeral"
  max_pods             = 110
  orchestrator_version = var.k8s_version
  vnet_subnet_id       = azurerm_subnet.private["private-1-west-europe"].id

  tags = {
    environment = var.environment
    project     = "tf-azure-aks"
  }
}

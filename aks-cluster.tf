resource "azurerm_kubernetes_cluster" "main" {
  name                              = "tf-azure-${var.environment}-cluster"
  location                          = azurerm_resource_group.main.location
  resource_group_name               = azurerm_resource_group.main.name
  dns_prefix                        = "tf-azure-${var.environment}-cluster"
  sku_tier                          = "Free"
  kubernetes_version                = var.k8s_version
  role_based_access_control_enabled = true
  node_os_channel_upgrade           = "None"

  identity {
    type = "SystemAssigned"
  }

  default_node_pool {
    name                 = "default"
    node_count           = 1
    vm_size              = "Standard_B2s"
    zones                = ["1"]
    type                 = "VirtualMachineScaleSets"
    enable_auto_scaling  = false
    os_disk_size_gb      = 30
    os_disk_type         = "Ephemeral"
    vnet_subnet_id       = azurerm_subnet.private["private-1-west-europe"].id
    max_pods             = 110
    orchestrator_version = var.k8s_version

    tags = {
      environment = var.environment
      project     = "tf-azure-aks"
    }
  }
}

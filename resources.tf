resource "azurerm_resource_group" "main" {
  name     = "tf-azure-${var.environment}-rg"
  location = var.az_location

  tags = {
    environment = var.environment
    project     = "tf-azure-aks"
  }
}

resource "azurerm_virtual_network" "main" {
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name

  name          = "tf-azure-${var.environment}-vnet"
  address_space = ["10.14.0.0/16"]

  tags = {
    environment = var.environment
    project     = "tf-azure-aks"
  }
}

resource "azurerm_subnet" "public" {
  name                 = "public-west-europe"
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = ["10.14.4.0/24"]
}

resource "azurerm_subnet" "private" {
  for_each = var.private_subnet

  name                                      = each.key
  resource_group_name                       = azurerm_resource_group.main.name
  virtual_network_name                      = azurerm_virtual_network.main.name
  address_prefixes                          = [each.value]
  private_endpoint_network_policies_enabled = false
}

resource "azurerm_resource_group" "demo" {
  name     = "as-${var.environment_short}-${var.location_short}-cis-demo-rg"
  location = var.location
  tags     = local.tags
}

resource "azurerm_virtual_network" "demo" {
  name                = "as-${var.environment_short}-${var.location_short}-cis-demo-vn"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.demo.location
  resource_group_name = azurerm_resource_group.demo.name
}

resource "azurerm_subnet" "demo" {
  name                 = "as-${var.environment_short}-${var.location_short}-cis-demo-sn"
  resource_group_name  = azurerm_resource_group.demo.name
  virtual_network_name = azurerm_virtual_network.demo.name
  address_prefixes     = ["10.0.2.0/24"]
  service_endpoints    = ["Microsoft.Sql", "Microsoft.Storage"]
}

resource "azurerm_storage_account" "demo" {
  name                = "as${var.environment_short}${var.location_short}cisdemosa"
  resource_group_name = azurerm_resource_group.demo.name

  location                 = azurerm_resource_group.demo.location
  account_tier             = local.account_tier
  account_replication_type = "LRS"

  network_rules {
    default_action             = "Deny"
    ip_rules                   = ["100.0.0.1"]
    virtual_network_subnet_ids = [azurerm_subnet.demo.id]
  }

  tags = local.tags
}
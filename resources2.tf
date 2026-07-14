resource "azurerm_resource_group" "infra_rg2" {
  name     = "platform-infra2-rg"
  location = "westeurope"

  tags = {
    RGOwner = "Platform"
  }
}

resource "azurerm_storage_account" "web_storage2" {
  name                     = "dmpltfwebsiteapp202602" # Must be globally unique, lowercase alphanumeric only
  resource_group_name      = azurerm_resource_group.infra_rg2.name
  location                 = azurerm_resource_group.infra_rg2.location
  account_kind             = "StorageV2"
  account_tier             = "Standard"
  account_replication_type = "LRS"
  min_tls_version          = "TLS1_2"
}

resource "azurerm_storage_account_static_website" "web2" {
  storage_account_id = azurerm_storage_account.web_storage2.id
  index_document     = "index.html"
}

resource "azurerm_role_assignment" "blob_contributor" {
  scope                = azurerm_storage_account.web_storage2.id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = var.app_deployer_object_id
}

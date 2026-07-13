resource "azurerm_resource_group" "infra_rg" {
  name     = "platform-infra-rg"
  location = "westeurope"

  tags = {
    RGOwner = "Platform"
  }
}

resource "azurerm_storage_account" "web_storage" {
  name                     = "dmpltfwebsiteapp2026" # Must be globally unique, lowercase alphanumeric only
  resource_group_name      = azurerm_resource_group.infra_rg.name
  location                 = azurerm_resource_group.infra_rg.location
  account_kind             = "StorageV2"
  account_tier             = "Standard"
  account_replication_type = "LRS"
  min_tls_version          = "TLS1_2"
}

resource "azurerm_storage_account_static_website" "web" {
  storage_account_id = azurerm_storage_account.web_storage.id
  index_document     = local_file.index
}

resource "local_file" "index" {
  filename = "index.html"
  content  = <<EOF
<!DOCTYPE html>
<html>
<head>
    <title>Deployed via Terraform</title>
</head>
<body>
    <h1>Deployment Successful!</h1>
    <p><strong>Commit ID:</strong> ${var.commit_id}</p>
</body>
</html>
EOF
}

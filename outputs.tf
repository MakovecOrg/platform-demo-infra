output "website_url" {
  value       = azurerm_storage_account.web_storage.primary_web_endpoint
  description = "The public web URL of your static hosted site."
}

output "sa" {
  value       = azurerm_storage_account.web_storage.id
  description = "Storage account"
}

output "sa_cont" {
  value       = azurerm_storage_container.web_container.name
  description = "Container"
}

output "sa_cont_addr" {
  value       = azurerm_storage_blob.index_file.name
  description = "Web root"
}

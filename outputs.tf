output "website_url" {
  value       = azurerm_storage_account.web_storage.primary_web_endpoint
  description = "The public web URL of your static hosted site."
}

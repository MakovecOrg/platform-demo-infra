resource "azurerm_resource_group" "infra_rg" {
  name     = "platform-infra-rg"
  location = "westeurope"

  tags = {
    RGOwner = "Platform"
  }
}

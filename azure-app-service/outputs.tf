output "function_app_name" {
  value = azurerm_app_service.app_service.id
  description = "App Service ID"
}
output "function_app_name" {
  value = azurerm_function_app_function.function_app.id
  description = "Deployed function ID"
}
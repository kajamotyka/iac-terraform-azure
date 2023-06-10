output "function_app_id" {
  value = azurerm_function_app_function.example.id
  description = "Deployed function ID"
}

output "function_app_name" {
  value = azurerm_function_app_function.example.name
  description = "Deployed function app name"
}

output "function_app_default_hostname" {
  value = azurerm_function_app_function.example.url
  description = "Deployed function app hostname"
}
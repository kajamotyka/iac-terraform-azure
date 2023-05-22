output "function_app_name" {
  value = azurerm_storage_blob.storage_blob.url
  description = "Storage url"
}
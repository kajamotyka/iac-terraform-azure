resource "azurerm_resource_group" "resource_group" {
  name = "${var.project}-${var.environment}-resource-group"
  location = var.location
}

resource "azurerm_storage_account" "storage_account" {
  name = "${var.project}${var.environment}storage"
  resource_group_name = azurerm_resource_group.resource_group.name
  location = var.location
  account_tier = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_service_plan" "app_service_plan" {
  name                = "${var.project}-${var.environment}-app-service-plan"
  resource_group_name = azurerm_resource_group.resource_group.name
  location            = var.location  
  os_type             = "Linux"
  sku_name            = "S1"
}

resource "azurerm_linux_function_app" "function_app" {
  name                       = "${var.project}-${var.environment}-function-app"
  resource_group_name        = azurerm_resource_group.resource_group.name
  location                   = var.location
  service_plan_id            = azurerm_service_plan.app_service_plan.id

  storage_account_name       = azurerm_storage_account.storage_account.name
  storage_account_access_key = azurerm_storage_account.storage_account.primary_access_key
  

  site_config {
    application_stack {
      python_version = "3.9"
    }
  }

  lifecycle {
    ignore_changes = [
      app_settings["WEBSITE_RUN_FROM_PACKAGE"],
    ]
  }
}

resource "azurerm_function_app_function" "example" {
  name            = "${var.project}-${var.environment}-app-function"
  function_app_id = azurerm_linux_function_app.function_app.id
  language        = "Python"
  file {
    name    = "function.py"
    content = file("function.py")
  }
  test_data = jsonencode({
    "name" = "Azure"
  })
  config_json = jsonencode({
    "scriptFile": "function.py",
    "bindings" = [
      {
        "authLevel" = "function"
        "direction" = "in"
        "methods" = [
          "get",
          "post",
        ]
        "name" = "req"
        "type" = "httpTrigger"
      },
      {
        "direction" = "out"
        "name"      = "$return"
        "type"      = "http"
      },
    ]
  })
}


output "log_analytics_workspace_id" {
  value = azurerm_log_analytics_workspace.law.id
}

output "log_analytics_workspace_name" {
  value = azurerm_log_analytics_workspace.law.name
}

output "log_analytics_workspace_primary_shared_key" {
  value = azurerm_log_analytics_workspace.law.primary_shared_key
}
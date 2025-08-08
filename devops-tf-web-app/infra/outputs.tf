output "webapp_name" {
    value = azurerm_linux_web_app.webapp.name
}

output "default_site_hostname" {
    value = azurerm_linux_web_app.webapp.default_hostname
}
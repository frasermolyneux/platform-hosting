output "app_service_plans" {
  value = {
    for key, plan in azurerm_service_plan.sp :
    key => {
      id                  = plan.id
      name                = plan.name
      resource_group_name = plan.resource_group_name
      location            = plan.location
      sku                 = plan.sku_name
      os_type             = plan.os_type
    }
  }
}

output "static_web_apps" {
  value = {
    for key, site in azurerm_static_web_app.swa :
    key => {
      id                  = site.id
      name                = site.name
      resource_group_name = site.resource_group_name
      location            = site.location
      default_host_name   = site.default_host_name
      sku_tier            = site.sku_tier
      sku_size            = site.sku_size
      identity = try({
        principal_id = site.identity[0].principal_id
        tenant_id    = site.identity[0].tenant_id
      }, null)
    }
  }
}

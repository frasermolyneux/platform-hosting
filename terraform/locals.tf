locals {
  workload_resource_groups_raw = data.terraform_remote_state.platform_workloads.outputs.workload_resource_groups[var.workload_name][var.environment].resource_groups

  workload_resource_groups = {
    for location, rg in local.workload_resource_groups_raw :
    lower(location) => rg
  }

  available_locations    = keys(local.workload_resource_groups)
  fallback_location      = length(local.available_locations) > 0 ? local.available_locations[0] : null
  primary_location       = contains(local.available_locations, lower(var.location)) ? lower(var.location) : local.fallback_location
  primary_resource_group = local.primary_location != null ? local.workload_resource_groups[local.primary_location] : null

  static_web_default_location = contains(local.available_locations, "westeurope") ? "westeurope" : local.primary_location

  resource_tags = merge({
    Environment = var.environment,
    Workload    = var.workload_name,
  }, var.tags)

  app_service_plans = {
    for key, plan in var.app_service_plans :
    key => {
      location           = lower(coalesce(plan.location, var.location))
      resource_group_key = contains(local.available_locations, lower(coalesce(plan.location, var.location))) ? lower(coalesce(plan.location, var.location)) : local.primary_location
      name               = "asp-${var.workload_name}-${var.environment}-${lower(coalesce(plan.location, var.location))}-${key}"
      sku                = plan.sku
      os_type            = plan.os_type
    }
  }

  static_web_apps = {
    for key, app in var.static_web_apps :
    key => {
      location           = lower(coalesce(app.location, local.static_web_default_location, var.location))
      resource_group_key = contains(local.available_locations, lower(coalesce(app.location, local.static_web_default_location, var.location))) ? lower(coalesce(app.location, local.static_web_default_location, var.location)) : local.primary_location
      name               = "swa-${var.workload_name}-${var.environment}-${lower(coalesce(app.location, local.static_web_default_location, var.location))}-${key}"
      sku_tier           = app.sku_tier
      sku_size           = app.sku_size
    }
  }
}

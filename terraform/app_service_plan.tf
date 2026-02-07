resource "azurerm_service_plan" "sp" {
  for_each = local.app_service_plans

  name                = each.value.name
  resource_group_name = data.azurerm_resource_group.rg[each.value.resource_group_key].name
  location            = data.azurerm_resource_group.rg[each.value.resource_group_key].location

  os_type  = each.value.os_type
  sku_name = each.value.sku

  tags = local.resource_tags
}

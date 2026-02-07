resource "azurerm_static_site" "swa" {
  for_each = local.static_web_apps

  name                = each.value.name
  resource_group_name = data.azurerm_resource_group.rg[each.value.resource_group_key].name
  location            = each.value.location

  sku_tier = each.value.sku_tier
  sku_size = each.value.sku_size

  identity {
    type = "SystemAssigned"
  }

  tags = local.resource_tags
}

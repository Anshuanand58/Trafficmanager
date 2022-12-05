data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}

data "azurerm_public_ip" "pip" {
  name                = var.pip_name
  resource_group_name = var.resource_group_name
}

resource "azurerm_traffic_manager_profile" "main" {
  name                   = var.profile_name
  resource_group_name    = var.resource_group_name
  traffic_routing_method = var.traffic_routing_method
  max_return             = var.max_return

  dns_config {
    relative_name = var.profile_name
    ttl           = var.dns_ttl
  }

  monitor_config {
    protocol                     = var.monitor_protocol
    port                         = var.monitor_port
    path                         = var.monitor_path
    interval_in_seconds          = var.monitor_probe_interval
    timeout_in_seconds           = var.monitor_probe_timeout
    tolerated_number_of_failures = var.monitor_tolerated_failures
  }

  tags = var.tags
}

resource "azurerm_traffic_manager_azure_endpoint" "main" {
  for_each            = var.traffic_manager_endpoints
  name                = each.key
  profile_id          = azurerm_traffic_manager_profile.main.id
  weight              = 100
  target_resource_id  = data.azurerm_public_ip.pip.id 
}
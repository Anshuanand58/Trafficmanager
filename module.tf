module "Trafficmanage" {
source = "../test"
  resource_group_name    = var.resource_group_name
  profile_name           = var.profile_name
  traffic_routing_method = var.traffic_routing_method
  max_return             = var.max_return
  monitor_port           = var.monitor_port
  monitor_path           = var.monitor_path
  pip_name               = var.pip_name
  traffic_manager_endpoints = {
    user1_vmss_0 = {
      target_ip = "1.1.1.1"
      weight    = "100"
    },
  }
  
}


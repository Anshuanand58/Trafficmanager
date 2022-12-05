  resource_group_name    = "demo-RG"
  profile_name           = "trafficmanage"
  traffic_routing_method = "Weighted"
  max_return             = 3
  monitor_port           = 6001
  monitor_path           = "/s"
  pip_name               = "demo-pip"     
  traffic_manager_endpoints = {
    user1_vmss_0 = {
      target_ip = "1.1.1.1"
      weight    = "100"
    },
  }

variable "resource_group_name" {
  type = string
}

variable "profile_name" {
  type = string
  default = ""
}

variable "traffic_routing_method" {
  type        = string
  description = "Specifies the algorithm used to route traffic, possible values are: Geographic, MultiValue, Performance, Priority, Subnet, Weighted"
}
variable "monitor_port" {
  type = number
}

variable "monitor_path" {
  type    = string
  default = ""
}
variable "max_return" {
  type        = number
  default     = null
  description = "The amount of endpoints to return for DNS queries to this Profile. Possible values range from 1 to 8."
}
variable "pip_name" {
    type = string
    default = ""
}
variable "tags" {
  type        = map(string)
  description = "Any tags can be set"
  default     = {}
}


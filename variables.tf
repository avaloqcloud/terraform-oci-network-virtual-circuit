variable "virtual_circuit" {
  description = "Virtual Circuit Input Object"
  type = object({
    # Required
    compartment_id = string,
    type           = string,
    # Optional
    bandwidth_shape_name = optional(string),
    bgp_admin_state      = optional(string),
    cross_connect_mappings = optional(list(object({
      bgp_md5auth_key                         = optional(string),
      cross_connect_or_cross_connect_group_id = optional(string),
      customer_bgp_peering_ip                 = optional(string),
      customer_bgp_peering_ipv6               = optional(string),
      oracle_bgp_peering_ip                   = optional(string),
      oracle_bgp_peering_ipv6                 = optional(string),
      vlan                                    = optional(string),
    }))),
    customer_asn        = optional(string),
    defined_tags        = optional(map(string)),
    display_name        = string,
    freeform_tags       = optional(map(string)),
    gateway_id          = string,
    ip_mtu              = optional(string),
    is_bfd_enabled      = optional(bool),
    is_transport_mode   = optional(bool),
    provider_service_id = optional(string),
    public_prefixes = optional(list(object({
      cidr_block = string
    }))),
    region         = optional(string),
    routing_policy = optional(list(string))
  })
  # Validation
  ## type
  validation {
    condition     = contains(["PRIVATE", "PUBLIC"], var.virtual_circuit.type)
    error_message = "Validation of the Virtual Circuit object failed. 'type' must be one of 'PRIVATE', 'PUBLIC'."
  }
  ## bandwidth_shape_name
  validation {
    condition     = var.virtual_circuit.bandwidth_shape_name != null ? (contains(["1 Gbps", "10 Gbps", "100 Gbps"], var.virtual_circuit.bandwidth_shape_name)) : true
    error_message = "Validation of the Cross Connect object failed. 'bandwidth_shape_name' must be one of '1 Gbps', '10 Gbps', '100 Gbps'."
  }
  ## bgp_admin_state
  validation {
    condition     = var.virtual_circuit.bgp_admin_state != null ? (contains(["ENABLED", "DISABLED"], var.virtual_circuit.bgp_admin_state)) : true
    error_message = "Validation of the Virtual Circuit object failed. 'bgp_admin_state' must be one of 'ENABLED, 'DISABLED'."
  }
  ## ip_mtu
  validation {
    condition     = var.virtual_circuit.ip_mtu != null ? (contains(["MTU_1500", "MTU_9000"], var.virtual_circuit.ip_mtu)) : true
    error_message = "Validation of the Virtual Circuit object failed. 'ip_mtu' must be one of 'MTU_1500', 'MTU_9000'."
  }
  ## routing_policy
  validation {
    condition     = var.virtual_circuit.routing_policy != null ? (contains(["REGIONAL", "MARKET_LEVEL", "GLOBAL", "ORACLE_SERVICE_NETWORK"])) : true
    error_message = "Validation of the Virtual Circuit object failed. 'routing_policy' must be one of 'Regional', 'Market', 'Global', 'Oracle Services Network'."
  }
}

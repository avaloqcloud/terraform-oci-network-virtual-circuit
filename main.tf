resource "oci_core_virtual_circuit" "this" {
  compartment_id       = var.virtual_circuit.compartment_id
  type                 = var.virtual_circuit.type
  bandwidth_shape_name = var.virtual_circuit.bandwidth_shape_name
  bgp_admin_state      = var.virtual_circuit.bgp_admin_state
  dynamic "cross_connect_mappings" {
    for_each = (var.virtual_circuit.cross_connect_mappings != null) ? var.virtual_circuit.cross_connect_mappings : []
    content {
      bgp_md5auth_key                         = try(cross_connect_mappings.value.bgp_admin_state, null)
      cross_connect_or_cross_connect_group_id = try(cross_connect_mappings.value.cross_connect_or_cross_connect_group_id, null)
      customer_bgp_peering_ip                 = try(cross_connect_mappings.value.customer_bgp_peering_ip, null)
      customer_bgp_peering_ipv6               = try(cross_connect_mappings.value.customer_bgp_peering_ipv6, null)
      oracle_bgp_peering_ip                   = try(cross_connect_mappings.value.oracle_bgp_peering_ip, null)
      oracle_bgp_peering_ipv6                 = try(cross_connect_mappings.value.oracle_bgp_peering_ipv6, null)
    }
  }
  customer_asn        = var.virtual_circuit.customer_asn
  defined_tags        = var.virtual_circuit.defined_tags
  display_name        = var.virtual_circuit.display_name
  freeform_tags       = var.virtual_circuit.freeform_tags
  gateway_id          = var.virtual_circuit.gateway_id
  ip_mtu              = var.virtual_circuit.ip_mtu
  is_bfd_enabled      = var.virtual_circuit.is_bfd_enabled
  is_transport_mode   = var.virtual_circuit.is_transport_mode
  provider_service_id = var.virtual_circuit.provider_service_id
  dynamic "public_prefixes" {
    for_each = (var.virtual_circuit.public_prefixes != null) ? var.virtual_circuit.public_prefixes : []
    content {
      cidr_block = public_prefixes.value.cidr_block
    }
  }
  region         = var.virtual_circuit.region
  routing_policy = var.virtual_circuit.routing_policy
}

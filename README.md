# Terraform OCI Core Virtual Circuit
The code provides a reusable and standalone Terraform module that provisions a Virtual Circuit on Oracle Cloud Infrastructure.

## Example Input
`virtual_circuit.auto.tfvars.json`:
```json
{
  "virtual_circuit": {
    "compartment_id": "ocid1.compartment_id",
    "type": "PRIVATE",
    "bandwidth_shape_name": "10 Gbps",
    "bgp_admin_state": "ENABLED",
    "cross_connect_mappings": [{
        "bgp_md5auth_key": "",
        "cross_connect_or_cross_connect_group_id": "ocid1.cross_connect_group_id",
        "customer_bgp_peering_ip": "192.0.2.0/31",
        "oracle_bgp_peering_ip": "192.0.2.1/31",
        "vlan": "100"
      }],
    "customer_asn": "65517",
    "display_name": "virtual_circuit_1",
    "gateway_id": "",
    "ip_mtu": "MTU_9000",
    "is_bfd_enabled": true,
    "is_transport_mode": false
  }
}
```
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.2.9 |
| <a name="requirement_oci"></a> [oci](#requirement\_oci) | 5.18.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_oci"></a> [oci](#provider\_oci) | 5.18.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [oci_core_virtual_circuit.this](https://registry.terraform.io/providers/oracle/oci/5.18.0/docs/resources/core_virtual_circuit) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_virtual_circuit"></a> [virtual\_circuit](#input\_virtual\_circuit) | Virtual Circuit Input Object | <pre>object({<br>    # Required<br>    compartment_id = string,<br>    type           = string,<br>    # Optional<br>    bandwidth_shape_name = optional(string),<br>    bgp_admin_state      = optional(string),<br>    cross_connect_mappings = optional(list(object({<br>      bgp_md5auth_key                         = optional(string),<br>      cross_connect_or_cross_connect_group_id = optional(string),<br>      customer_bgp_peering_ip                 = optional(string),<br>      customer_bgp_peering_ipv6               = optional(string),<br>      oracle_bgp_peering_ip                   = optional(string),<br>      oracle_bgp_peering_ipv6                 = optional(string),<br>      vlan                                    = optional(string),<br>    }))),<br>    customer_asn        = optional(string),<br>    defined_tags        = optional(map(string)),<br>    display_name        = string,<br>    freeform_tags       = optional(map(string)),<br>    gateway_id          = string,<br>    ip_mtu              = optional(string),<br>    is_bfd_enabled      = optional(bool),<br>    is_transport_mode   = optional(bool),<br>    provider_service_id = optional(string),<br>    public_prefixes = optional(list(object({<br>      cidr_block = string<br>    }))),<br>    region         = optional(string),<br>    routing_policy = optional(list(string))<br>  })</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_virtual_circuit"></a> [virtual\_circuit](#output\_virtual\_circuit) | Virtual Circuit output object |
<!-- END_TF_DOCS -->
# Terraform OCI Core Virtual Circuit
The code provides a reusable and standalone Terraform module that provisions a Virtual Circuit on Oracle Cloud Infrastructure.

## Example Input
`virtual_circuit.auto.tfvars.json`:
```json
{
  "virtual_circuit": {
    "compartment_id": "ocid1.compartment_id",
    "display_name": "my-cross-connect-1",
    "port_speed_shape_name": "10 Gbps",
    "cross_connect_group_id": "ocid1.cross_connect_group_id",
    "customer_reference_name": "my-cross-connect-1",
    "macsec_properties": [{
        "state": "ENABLED",
        "encryption_cipher": "aes128-gcm-xpn",
        "is_unprotected_traffic_allowed": false,
        "primary_key": [{
          "connectivity_association_key_secret_id": "ocid1.connectivity_association_key_secret_id",
          "connectivity_association_name_secret_id": "ocid1.connectivity_association_name_secret_id"
        }]
      }]
  }
}
```
#creating tunnels
resource "google_compute_vpn_tunnel" "tunnel1" {
  name                  = "vpn-tunnel1"
  region                = "europe-west2"
  vpn_gateway           = google_compute_ha_vpn_gateway.gateway1.id
  router                = "vpn-router1"
  peer_gcp_gateway      = google_compute_ha_vpn_gateway.gateway2.id
  shared_secret         = data.google_kms_secret.vpn_secret.plaintext
  vpn_gateway_interface = 0
   depends_on = [google_compute_ha_vpn_gateway.gateway1, google_compute_ha_vpn_gateway.gateway2,google_compute_router.router1, google_compute_router.router2]
}

resource "google_compute_vpn_tunnel" "tunnel2" {
  name                  = "vpn-tunnel2"
  provider              = google.new-provider
  vpn_gateway           = google_compute_ha_vpn_gateway.gateway2.id
  peer_gcp_gateway      = google_compute_ha_vpn_gateway.gateway1.id
  shared_secret         = data.google_kms_secret.vpn_secret.plaintext
  router                = "vpn-router2"
  vpn_gateway_interface = 0
   depends_on = [google_compute_ha_vpn_gateway.gateway1, google_compute_ha_vpn_gateway.gateway2,google_compute_router.router1, google_compute_router.router2]
}

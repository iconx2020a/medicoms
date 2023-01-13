#creating gateways
resource "google_compute_ha_vpn_gateway" "gateway1" {
  region  = var.regions[1]
  name    = "vpn-1"
  network = google_compute_network.public_vpn_network_1.id
}
resource "google_compute_ha_vpn_gateway" "gateway2" {
 provider = google.new-provider
  name    = "vpn-2"
  network = google_compute_network.internal_vpn_network_1.id
}

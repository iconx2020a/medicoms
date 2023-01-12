#creating gateways
resource "google_compute_ha_vpn_gateway" "gateway1" {
  region  = "us-central1"
  name    = "vpn-1"
  network = google_compute_network.network1.id
}

resource "google_compute_ha_vpn_gateway" "gateway2" {
  region  = "us-central1"
  name    = "vpn-2"
  network = google_compute_network.network2.id
}


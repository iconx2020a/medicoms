#creating routers
resource "google_compute_router" "router1" {
  name    = "vpn-router1"
  region = var.regions[1]
  network = google_compute_network.public_vpn_network_1.name
  bgp {
    asn = 64514
  }
}
resource "google_compute_router" "router2" {
  provider = google.new-provider
  name    = "vpn-router2"
  network = google_compute_network.internal_vpn_network_1.name
  bgp {
    asn = 64515
  }
}


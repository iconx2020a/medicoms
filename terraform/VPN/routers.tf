#creating routers
resource "google_compute_router" "router1" {
  name    = "vpn-router1"
  network = google_compute_network.network1.name
  bgp {
    asn = 64514
  }
}

resource "google_compute_router" "router2" {
  name    = "vpn-router2"
  network = google_compute_network.network2.name
  bgp {
    asn = 64515
  }
}

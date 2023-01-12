resource "google_compute_network" "network1" {
  name                    = "network1"
  routing_mode            = "GLOBAL"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "network1_subnet1" {
  name          = "vpn-subnet-1"
  ip_cidr_range = "10.0.1.0/24"
  region        = "us-central1"
  network       = google_compute_network.network1.id
}

resource "google_compute_network" "network2" {
  name                    = "network2"
  routing_mode            = "GLOBAL"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "network2_subnet2" {
  name          = "vpn-subnet-2"
  ip_cidr_range = "192.168.2.0/24"
  region        = "us-central1"
  network       = google_compute_network.network2.id
}

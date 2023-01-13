resource "google_compute_network" "host_network" {
  name                = "host-network"
  project             =  var.projects[0]
  routing_mode            = "GLOBAL"
  auto_create_subnetworks = false
}
resource "google_compute_subnetwork" "host_public_subnet" {
  name          = "host-public-subnet"
  ip_cidr_range = var.cidr[0]
  region        = var.regions[0]
  network       = google_compute_network.host_network.id
}
resource "google_compute_subnetwork" "host_internal_subnet" {
  name          = "host-internal-subnet"
  ip_cidr_range = var.cidr[1]
  region        = var.regions[1]
  network       = google_compute_network.host_network.id
}

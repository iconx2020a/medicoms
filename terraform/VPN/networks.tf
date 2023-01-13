resource "google_compute_network" "public_vpn_network_1" {
  name                   = "public-vpn-network-1"
  routing_mode           = "GLOBAL"
  auto_create_subnetworks = false
}
resource "google_compute_subnetwork" "public_vpn_subnet_1" {
  name          = "public-vpn-subnet-1"
  ip_cidr_range = var.cidr[0]
  region        = var.regions[0]
  network       = google_compute_network.public_vpn_network_1.id
}
#***************internal network ********************
resource "google_compute_network" "internal_vpn_network_1" {
  name                    = "internal-vpn-network-1"
  routing_mode            = "GLOBAL"
  provider = google.new-provider
  project      = var.projects[1]
  auto_create_subnetworks = false
}
resource "google_compute_subnetwork" "internal_vpn_subnet_1" {
  name          = "internal-vpn-subnet-1"
  ip_cidr_range =  var.cidr[1]
  region        = var.regions[1]
  project      = var.projects[1]
  provider = google.new-provider
  network       = google_compute_network.internal_vpn_network_1.id
}

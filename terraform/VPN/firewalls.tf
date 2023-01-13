resource "google_compute_firewall" "public_vpn_instance_ssh_rule" {
  name = "public-vpn-instance-ssh-rule"
  network = google_compute_network.public_vpn_network_1.name
  allow {
    protocol = "tcp"
    ports = var.ports
  }
  target_tags = ["public-vpn-instance-1"]
  source_ranges = var.ip_ranges
}
resource "google_compute_firewall" "internal_vpn_instance_icmp" {
  name = "inetrnal-vpn-instance-icmp"
  provider = google.new-provider
  network = google_compute_network.internal_vpn_network_1.name
  allow {
    protocol = "icmp"
  }
  target_tags = ["internal-vpn--instance-1"]
  source_ranges = var.ip_ranges
}

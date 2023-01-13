resource "google_compute_firewall" "instance_1_ssh_rule" {
  name = "instance-1-ssh-rule"
  network = google_compute_network.host_network.name
  allow {
    protocol = "tcp"
    ports = var.ports
  }
  target_tags = ["instance-1"]
  source_ranges = var.ip_ranges
}
resource "google_compute_firewall" "instance_2_ssh_rule" {
  name = "instance-1-ssh-rule"
  network = google_compute_network.host_network.name
  allow {
    protocol = "tcp"
    ports = var.ports
  }
  target_tags = ["instance-2"]
  source_ranges = var.ip_ranges
}

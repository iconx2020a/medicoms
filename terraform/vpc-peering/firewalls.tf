resource "google_compute_firewall" "public_ssh_rule" {
  name = "public-ssh-rule"
  network = google_compute_network.public_vpc_tf.name
  allow {
    protocol = "tcp"
    ports = var.ports  #port 22 for ssh
  }
  target_tags = ["public-vm-tag"]
  source_ranges = var.ip_ranges
}
resource "google_compute_firewall" "internal_ssh_rule" {
  name = "internal-ssh-rule"
  network = google_compute_network.internal_vpc_tf.name
  provider = google.new-provider
  allow {
    protocol = "icmp"
  }
  target_tags = ["internal-vm-tag"]
  source_ranges = var.ip_ranges
}

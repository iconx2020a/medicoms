resource "google_compute_firewall" "instance_1_ssh_rule" {
  name = "instance-1-ssh-rule"
  network = google_compute_network.network1.name
  allow {
    protocol = "tcp"
    ports = ["22"]
  }
  target_tags = ["network1-instance"]
  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "instance_2_ssh-rule" {
  name = "instance-2-ssh-rule"
  network = google_compute_network.network2.name
  allow {
    protocol = "icmp"
  }
  target_tags = ["network2-instance"]
  source_ranges = ["0.0.0.0/0"]
}


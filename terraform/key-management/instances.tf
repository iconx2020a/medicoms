resource "google_compute_instance" "public_vpn_instance_1" {
  name         = "public-vpn-instance-1"
  machine_type = var.machine_type
  zone         = var.zones[0]
  tags = ["public-vpn-instance-1"]
  boot_disk {
    initialize_params {
      image = var.images[0]
      labels = {
        my_label = "publlic-vpn-instance"
      }
    }
  }
  network_interface {
    network = google_compute_network.public_vpn_network_1.name
    subnetwork = google_compute_subnetwork.public_vpn_subnet_1.name
    access_config {
  // Ephemeral public IP
    }
  }
  metadata = {
      ssh-keys = "${split("@", data.google_client_openid_userinfo.myid.email)[0]}:${tls_private_key.ssh.public_key_openssh}"
  }
}
resource "google_compute_instance" "internal_vpn_instance_1" {
 provider = google.new-provider
  name         = "internal-vpn-instance-1"
  machine_type = var.machine_type
  zone         = var.zones[1]
  tags = ["internal-vpn--instance-1"]
  boot_disk {
    initialize_params {
      image = var.images[0]
      labels = {
        my_label = "inetrnal-vpn-instance-1"
      }
    }
  }

  network_interface {
    network = google_compute_network.internal_vpn_network_1.name
    subnetwork = google_compute_subnetwork.internal_vpn_subnet_1.name
  }
  metadata = {
  }
  metadata_startup_script = "echo instance 2 of network 2 > /test.txt"
}


resource "google_compute_instance" "network1_instance" {
  name         = "network1-instance"
  machine_type = "e2-micro"
  zone         = "us-central1-a"
  tags = ["network1-instance"]
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      labels = {
        my_label = "value1"
      }
    }
  }
  network_interface {
    network = google_compute_network.network1.name
    subnetwork = "vpn-subnet-1"
    access_config {
      // Ephemeral public IP
    }
  }
  metadata = {
      ssh-keys = "${split("@", data.google_client_openid_userinfo.me.email)[0]}:${tls_private_key.ssh.public_key_openssh}"
  }
}
resource "google_compute_instance" "network2_instance" {
  name         = "network2-instance"
  machine_type = "e2-micro"
  zone         = "us-central1-a"
  tags = ["network2-instance"]
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      labels = {
        my_label = "value2"
      }
    }
  }

  network_interface {
    network = google_compute_network.network2.name
    subnetwork = "vpn-subnet-2"
    access_config {
      // Ephemeral public IP
    }
  }
  metadata = {
  }
  metadata_startup_script = "echo instance 2 of network 2 > /test.txt"
}

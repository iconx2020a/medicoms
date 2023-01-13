resource "google_compute_instance" "instance_1" {
  name         = "instance-1"
  #provider = google.new-provider
  project = var.projects[1]
  machine_type = var.machine_type
  zone         = var.zones[0]
  tags = ["instance-1"]
  boot_disk {
    initialize_params {
      image = var.images[0]
      labels = {
        my_label = "instance-1"
      }
    }
  }
  network_interface {
    subnetwork = google_compute_subnetwork.host_public_subnet.name
    access_config {
  // Ephemeral public IP
    }
  }
  metadata = {
      ssh-keys = "${split("@", data.google_client_openid_userinfo.myid.email)[0]}:${tls_private_key.ssh.public_key_openssh}"
  }
}

resource "google_compute_instance" "instance_2" {
  name         = "instance-2"
  project = var.projects[2]
  machine_type = var.machine_type
  zone         = var.zones[1]
  tags = ["instance-2"]
  boot_disk {
    initialize_params {
      image = var.images[0]
      labels = {
        my_label = "instance-2"
      }
    }
  }
  network_interface {
    subnetwork = google_compute_subnetwork.host_internal_subnet.name
    access_config {
  // Ephemeral public IP
    }
  }
  metadata = {
      ssh-keys = "${split("@", data.google_client_openid_userinfo.myid.email)[0]}:${tls_private_key.ssh.public_key_openssh}"
  }

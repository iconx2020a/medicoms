resource "google_compute_instance" "public_vm_1" {
  name         = "public-vm-1"
  machine_type = var.machine_type
  zone         = var.zones[0]
  tags = ["public-vm-tag"]
  boot_disk {
    initialize_params {
      image = var.images[0]
      labels = {
        my_label = "public-vm-1"
      }
    }
  }
  network_interface {
    network = google_compute_network.public_vpc_tf.name
    subnetwork = google_compute_subnetwork.public_subnet_tf.name
    access_config {
      #Generate Ephemeral public IP
    }
  }
  metadata = {
      ssh-keys = "${split("@", data.google_client_openid_userinfo.myid.email)[0]}:${tls_private_key.ssh.public_key_openssh}"
  }
  depends_on = [google_compute_network.public_vpc_tf]
}
resource "google_compute_instance" "internal_vm_1" {
  name         = "internal-vm-1"
  machine_type = var.machine_type
  provider = google.new-provider
  zone         = var.zones[1]
  tags = ["internal-vm-tag"]
  boot_disk {
    initialize_params {
      image = var.images[0]
      labels = {
        my_label = "internal-vm-1"
      }
    }
  }
  network_interface {
    network = google_compute_network.internal_vpc_tf.name
    subnetwork = google_compute_subnetwork.internal_subnet_tf.name
  }
  metadata = {
  }
  metadata_startup_script = "echo internal instance > /test.txt"
  depends_on = [google_compute_network.internal_vpc_tf]
}

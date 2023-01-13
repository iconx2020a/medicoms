resource "google_compute_network_peering" "public_to_internal_tf" {
 name         = "public-to-internal-tf"
 network = google_compute_network.internal_vpc_tf.self_link
 peer_network = google_compute_network.public_vpc_tf.self_link
 depends_on = [google_compute_network.public_vpc_tf, google_compute_network.internal_vpc_tf]
}
resource "google_compute_network_peering" "internal_to_public_tf" {
  name         = "internal-to-public-tf"
  network      = google_compute_network.public_vpc_tf.self_link
  peer_network = google_compute_network.internal_vpc_tf.self_link
  depends_on = [google_compute_network.public_vpc_tf,google_compute_network.internal_vpc_tf]
}

#find user data
data "google_client_openid_userinfo" "myid"{}

/*
data "google_kms_key_ring" "medicoms_key_ring" {
  project  = var.projects[0]
  name     = "medicoms-key-ring"
  location = "global"
}

data "google_kms_crypto_key" "vpn_key" {
  name     = "vpn-key"
  key_ring = google_kms_key_ring.medicoms_key_ring.id
}
*/


data "google_kms_key_ring" "my_key_ring" {
  name     = "medicoms_key_ring"
  location = "global"
}

data "google_kms_crypto_key" "my_crypto_key" {
  name     = "vpn_keys"
  key_ring = data.google_kms_key_ring.my_key_ring.id
}


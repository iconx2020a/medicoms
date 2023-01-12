terraform {
  required_version = ">= 0.13"
    required_providers {
    tls = {
      source  = "hashicorp/tls"
      version = "3.1.0"
    }
  }
}
provider "google" {
   credentials = file("newkey.json")
   region = "us-central1"
}
provider "google-beta" {
   credentials = file("newkey.json")
   region = "us-central1"
}
provider "tls" {
  // no config needed
}

#find user data
data "google_client_openid_userinfo" "me" {}

#set ssh keys arguments
resource "tls_private_key" "ssh" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_file" "ssh_private_key_pem" {
  content         = tls_private_key.ssh.private_key_pem
  filename        = ".ssh/google_compute_engine"
  file_permission = "0600"
}
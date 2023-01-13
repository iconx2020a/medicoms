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
  project = var.projects[0]
  region  = var.regions[0]
}
provider "tls" {
  // no config needed
}

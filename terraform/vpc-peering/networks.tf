resource "google_compute_network" "public_vpc_tf" {
  #use default project and region
  name         = "public-vpc-tf"
  auto_create_subnetworks = false
}
resource "google_compute_subnetwork" "public_subnet_tf" {
  #use default project and region
  name          = "public-subnet-tf"
  ip_cidr_range = var.cidr[0]
  network       = google_compute_network.public_vpc_tf.id
}
resource "google_compute_network" "internal_vpc_tf" {
  #must specify project 
  name         = "internal-vpc-tf"
  project      = var.projects[1]
  auto_create_subnetworks = false
}
resource "google_compute_subnetwork" "internal_subnet_tf" {
   #must specify project and  region  
  name          = "internal-subnet-tf"
  ip_cidr_range =  var.cidr[1]
  region        = var.regions[1]
  project      = var.projects[1]
  network       = google_compute_network.internal_vpc_tf.id
}

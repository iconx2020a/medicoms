#initiate the host project
resource "google_compute_shared_vpc_host_project" "host" {
  project = var.projects[0]
}
# Associate the first service project to host project
resource "google_compute_shared_vpc_service_project" "service1" {
  host_project    = google_compute_shared_vpc_host_project.host.project
  service_project = var.projects[1]
}
#Associate the second service project
resource "google_compute_shared_vpc_service_project" "service2" {
  host_project    = google_compute_shared_vpc_host_project.host.project
  service_project = var.projects[2]
}

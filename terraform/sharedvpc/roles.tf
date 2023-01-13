resource "google_project_iam_binding" "role-1" {
  project = var.projects[1]
  role    = "roles/compute.networkUser"
  members = [
    "user:anna@medicoms.org",
  ]
}
resource "google_project_iam_binding" "role-2" {
  project = var.projects[2]
  role    = "roles/compute.networkUser"
  members = [
    "user:anna@medicoms.org",
  ]
}

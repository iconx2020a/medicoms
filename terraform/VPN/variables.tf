variable ip_ranges {
  type = list
  default = ["0.0.0.0/0"]
}
variable cidr {
  type = list
  default = ["10.2.0.0/19","10.2.32.0/19"]
}
variable ports {
 type = list
 default = ["22"]
}
variable projects {
 type = list
 default = ["public-project-372806", "internal-project-372806", "restricted-project-372806"]
}
variable regions {
  type = list
  default = ["europe-west1", "europe-west2"]
}

variable zones {
  type = list
  default = ["europe-west1-b", "europe-west2-c"]
}
variable images {
  type = list
  default = ["debian-cloud/debian-11"]
}
variable machine_type {
  type = string
  default = "e2-micro"
}

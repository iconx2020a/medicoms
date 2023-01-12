#find user data
data "google_client_openid_userinfo" "myid"{}

#set up secret data
data "google_secret_manager_secret_version" "my_vpn_secret" {
  provider = google-beta
  project = var.projects[0]
  secret  = "vpn-secret"
  version = "1"
}









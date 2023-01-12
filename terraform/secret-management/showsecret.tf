
output "secret" {
  value = nonsensitive(data.google_secret_manager_secret_version.my_vpn_secret.secret_data)
}


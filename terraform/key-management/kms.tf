 data "google_kms_secret" "vpn_secret" {
  crypto_key = data.google_kms_crypto_key.my_crypto_key.id
  ciphertext = "CiQAa+zPmF8mWsesrgqPQuk+XWNM2Jg8k7yOWxOr0n5vCmJcD64SOACeCrQd5T5fWlENfuREh1d50V85RA1zYFRgIj9DVoAuW7YittEHHTZt7saRfKx36I9mpdgeFKu0"
}

output "token_value" {
 value = nonsensitive(data.google_kms_secret.vpn_secret.plaintext)
}

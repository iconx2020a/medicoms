 data "google_kms_secret" "vpn_secret" {
  crypto_key = data.google_kms_crypto_key.my_crypto_key.id
  ciphertext = "CiQAa+zPmF8mWsesrgqPQuk+XWNM2Jg8k7yOWxOr0n5vCmJcD64SOACeCrQd5T5fWlENfuREh1d50V85RA1zYFRgIj9DVoAuW7YittEHHTZt7saRfKx36I9mpdgeFKu0"
}

output "token_value" {
 value = nonsensitive(data.google_kms_secret.vpn_secret.plaintext)
}

/*
Enable kms api
Add Cloud KMS Admin role for user and terraform service account.
create key ring

gcloud kms keyrings create medicoms_key_ring --location "global"

gcloud kms keyrings create test --location "europe-west1"

global or region (e.g. europe-west1)

Create an encryption key
gcloud kms keys create KEY_NAME \
    --keyring KEY_RING \
    --location LOCATION \
    --purpose "encryption" \
    --protection-level "PROTECTION_LEVEL"


    gcloud kms keys create vpn_keys \
    --keyring medicoms_key_ring \
    --location "global" \
    --purpose "encryption" \
    --protection-level "software"

    https://cloud.google.com/kms/docs/create-encryption-keys

List your key
gcloud kms keys list \
    --location "global" \
    --keyring "medicoms_key_ring"
Create a file with secret (secret.txt)
encrypt your secret
    gcloud kms encrypt \
    --location "global" \
    --keyring "medicoms_key_ring" \
    --key "vpn_keys" \
    --plaintext-file ./secret.txt \
    --ciphertext-file ./secret.txt.encrypted
decrypt the secret

    gcloud kms decrypt \
    --location "global" \
    --keyring "medicoms_key_ring" \
    --key "vpn_keys" \
    --ciphertext-file ./secret.txt.encrypted\
    --plaintext-file ./secret.txt.decrypted

    grant permission to service account
    https://cloud.google.com/kms/docs/iam
    https://adamtheautomator.com/gcp-kms/

    cloud kms keys add-iam-policy-binding key \
    --keyring key-ring \
    --location location \
    --member principal-type:principal-email \
    --role roles/role


    gcloud kms keys add-iam-policy-binding vpn_keys \
    --keyring "medicoms_key_ring" \
    --location "global" \
    --member "serviceAccount":"test-terraform@public-project-372806.iam.gserviceaccount.com"\
    --role "roles/cloudkms.admin"


//another method
    gcloud kms keys add-iam-policy-binding vpn_keys \
    --keyring "medicoms_key_ring" \
    --location "global" \
    --member "serviceAccount":"test-terraform@public-project-372806.iam.gserviceaccount.com"\
    --role "roles/cloudkms.cryptoKeyEncrypterDecrypter

gcloud kms keys add-iam-policy-binding vpn_keys --keyring='medicoms_key_ring' --location='global' --member='serviceAccount:test-terraform@public-project-372806.iam.gserviceaccount.com' --role='roles/editor'

Convert secret to base 64 encoding
cat secret.txt.encrypted | base64

 clean up
 gcloud kms keys versions destroy key-version \
 --location "global" \
 --keyring "medicoms_key_ring" \
 --key "vpn_keys"
*/





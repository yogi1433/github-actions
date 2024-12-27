resource "local_file" "private_key" {
  filename        = "${path.module}/id_rsa"
  content         = tls_private_key.key_pair.private_key_pem
  file_permission = 0600
}

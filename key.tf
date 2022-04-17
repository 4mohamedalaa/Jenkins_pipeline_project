resource "tls_private_key" "key_form" {
  algorithm = "RSA"
  rsa_bits  = 4096

}
resource "aws_key_pair" "key" {
  key_name   = "myKey"
  public_key = tls_private_key.key_form.public_key_openssh
}
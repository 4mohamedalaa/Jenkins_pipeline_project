output "bastion_public_ip" {
       value = aws_instance.bastion.public_ip
}
output "application_private_ip" {
       value = aws_instance.bastion.private_ip
}
output "private_key" {
       value = tls_private_key.key_form.private_key_pem
       sensitive = true
}

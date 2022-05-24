output "bastion_public_ip" {
       value = aws_instance.bastion.public_ip
}
output "application_private_ip" {
       value = aws_instance.application.private_ip
}
output "private_key" {
       value = tls_private_key.key_form.private_key_pem
       sensitive = true
}
output "rds_add" {
  value = aws_db_instance.rds.address

}
output "rds_port" {
  value = aws_db_instance.rds.port

}
output "redis_add" {
  value = aws_elasticache_cluster.elasticache.cache_nodes[0].address

}

output "redis_port" {
  value= aws_elasticache_cluster.elasticache.port

}
output "app_link" {
  value = aws_lb.LB.dns_name

}

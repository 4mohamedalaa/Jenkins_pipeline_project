resource "aws_db_instance" "rds" {
  allocated_storage = 8
  engine            = var.engine
  engine_version    = var.engine_version
  # Declaring the instance class
  instance_class = var.instance_class
  name           = var.db_name
  # User to connect the database instance 
  username = var.username
  # Password to connect the database instance 
  password             = var.password
  db_subnet_group_name = aws_db_subnet_group.GG.name
  skip_final_snapshot  = true
  vpc_security_group_ids = ["${aws_security_group.rds.id}"]
  port                 = var.port



}
resource "aws_db_subnet_group" "GG" {
  name       = "subnet-group"
  subnet_ids = [module.network.private1, module.network.private2]

}

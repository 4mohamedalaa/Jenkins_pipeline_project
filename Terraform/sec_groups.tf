resource "aws_security_group" "bastion" {
  name        = "allow_ssh"
  description = "Allow ssh inbound traffic"
  vpc_id      = module.network.vpc_id
  ingress {
    description = "ssh"
    from_port   = 0
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }

  tags = {
    Name = "allow_ssh"
  }
}
resource "aws_security_group" "application" {
  name        = "allow_ssh and port 3000"
  description = "Allow ssh and port 3000 from vpc cidr only"
  vpc_id      = module.network.vpc_id
  ingress {
    description = "ssh"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }
 
  ingress {
    description = "allow 3000"
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    # cidr_blocks = [module.network.vpc_cider]
    cidr_blocks = ["0.0.0.0/0"]


  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }

  tags = {
    Name = "allow_ssh(application)"
  }
}
resource "aws_security_group" "rds" {
  name   = "rds_sec"
  vpc_id = module.network.vpc_id
  ingress {
    description = "3306"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]

  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }

  tags = {
    Name = "RDS"
  }
}
resource "aws_security_group" "elasticache" {
  name   = "elasticache"
  vpc_id = module.network.vpc_id
 ingress {
    description = "elasticache"
    from_port   = 6379
    to_port     = 6379
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]


  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }

  tags = {
    Name = "elasticache"
  }
}

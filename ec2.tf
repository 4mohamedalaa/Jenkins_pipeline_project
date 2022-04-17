resource "aws_instance" "bastion" {
  ami             = data.aws_ami.ubuntu.id
  instance_type   = "t2.micro"
  subnet_id       = module.network.public1
  key_name        = "myKey"
  security_groups = ["${aws_security_group.bastion.id}"]
  provisioner "local-exec" {
    command = "echo IP address is ${self.public_ip} > id.txt"
  }

  tags = {
    Name = "bastion"
  }
}
resource "aws_instance" "application" {
  ami             = data.aws_ami.ubuntu.id
  instance_type   = "t2.micro"
  subnet_id       = module.network.private1
  key_name        = "myKey"
  security_groups = ["${aws_security_group.application.id}"]
  tags = {
    Name = "application"
  }
}
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}
resource "aws_vpc" "ITI" {
  cidr_block           = var.cider
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = var.Name
  }
}

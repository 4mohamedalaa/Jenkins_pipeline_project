resource "aws_internet_gateway" "iti" {
  vpc_id = aws_vpc.ITI.id

  tags = {
    "Name" = "ITI"
  }
}

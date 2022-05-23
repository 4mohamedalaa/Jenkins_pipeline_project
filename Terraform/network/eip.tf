resource "aws_eip" "lb" {
  #   instance = aws_instance.ITI.id
  #   vpc      = true
  tags = {
    "Name" = "ITI"
  }
}
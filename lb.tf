resource "aws_lb" "LB" {
  name               = "lb"
  internal           = false
  load_balancer_type = "network"
  subnets            = [module.network.public1,module.network.public2]

  tags = {
    Environment = "application"
  }
}
resource "aws_lb_target_group" "LB_target_group" {
  name        = "LB-TG"
  port        = 3000
  protocol    = "TCP"
  vpc_id      = module.network.vpc_id
  }

resource "aws_lb_target_group_attachment" "one" {
  target_group_arn = aws_lb_target_group.LB_target_group.arn
  target_id        = aws_instance.application.id
  port             = 3000
}
resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.LB.arn
  port              = "80"
  protocol          = "TCP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.LB_target_group.arn
  }
}
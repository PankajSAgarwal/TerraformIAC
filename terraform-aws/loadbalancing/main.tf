#------------loadbalancing/main.tf-------------
resource "aws_lb" "pankaj_lb" {
  name = "pankaj-loadbalancer"
  subnets = var.public_subnets
  security_groups = [var.public_sg]
  idle_timeout = 400
}
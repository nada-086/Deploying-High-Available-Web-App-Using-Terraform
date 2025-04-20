# EC2 Instances Security Group
resource "aws_lb" "app_lb" {
    name               = "my-app-lb"
    internal           = false
    load_balancer_type = "application"
    subnets            = [aws_subnet.public_subnet_1.id, aws_subnet.public_subnet_2.id]
    security_groups    = [aws_security_group.lb_sg.id]
}

resource "aws_lb_target_group" "app_tg" {
    name     = "app-target-group"
    port     = 80
    protocol = "HTTP"
    vpc_id   = aws_vpc.main.id
    health_check {
        path                = "/"
        protocol            = "HTTP"
        port                = "80"
        interval            = 30
        timeout             = 5
        healthy_threshold   = 2
        unhealthy_threshold = 5
    }
}

resource "aws_lb_listener" "http_listener" {
    load_balancer_arn = aws_lb.app_lb.arn
    port              = 80
    protocol          = "HTTP"

    default_action {
        type             = "forward"
        target_group_arn = aws_lb_target_group.app_tg.arn
    }
}

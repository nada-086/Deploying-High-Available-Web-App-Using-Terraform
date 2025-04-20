# Security Group Declaration
resource "aws_security_group" "http_sg" {
    name        = "http-sg"
    vpc_id      = aws_vpc.main.id
}

resource "aws_vpc_security_group_ingress_rule" "allow_http" {
    security_group_id = aws_security_group.http_sg.id
    referenced_security_group_id = aws_security_group.lb_sg.id
    from_port         = 80
    ip_protocol       = "tcp"
    to_port           = 80
}


resource "aws_vpc_security_group_egress_rule" "egress_traffic" {
    security_group_id = aws_security_group.http_sg.id
    cidr_ipv4         = "0.0.0.0/0"
    ip_protocol       = "-1"
}


# Load Balancer Security Group
resource "aws_security_group" "lb_sg" {
    name        = "load-balancer-sg"
    description = "Security group for the load balancer"
    vpc_id      = aws_vpc.main.id

    ingress {
        description = "Allow HTTP traffic from anywhere"
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        description = "Allow all outbound traffic"
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "Load Balancer Security Group"
    }
}
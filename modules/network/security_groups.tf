# Security Group Declaration
resource "aws_security_group" "http_sg" {
    name        = "http-sg"
    vpc_id      = aws_vpc.main.id
}

resource "aws_vpc_security_group_ingress_rule" "allow_http" {
    security_group_id = aws_security_group.http_sg.id
    cidr_ipv4         = aws_vpc.main.cidr_block
    from_port         = 80
    ip_protocol       = "tcp"
    to_port           = 80
}


resource "aws_vpc_security_group_egress_rule" "egress_traffic" {
    security_group_id = aws_security_group.http_sg.id
    cidr_ipv4         = "0.0.0.0/0"
    ip_protocol       = "-1"
}
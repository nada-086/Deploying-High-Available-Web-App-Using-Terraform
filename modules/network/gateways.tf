# Internet Gateway
resource "aws_internet_gateway" "internet_gw" {
    vpc_id = aws_vpc.main.id
}

# NAT Gateway
resource "aws_nat_gateway" "nat_gw" {
    allocation_id = aws_eip.nat_ip.id
    subnet_id     = aws_subnet.public_subnet.id
    depends_on = [aws_internet_gateway.internet_gw]
}

# Elastic IP Configuration
resource "aws_eip" "nat_ip" {
    domain = "vpc"
}
# Internet Gateway
resource "aws_internet_gateway" "internet_gw" {
    vpc_id = aws_vpc.main.id
}

# NAT Gateway
resource "aws_nat_gateway" "nat_gw_1" {
    allocation_id = aws_eip.nat_ip_1.id
    subnet_id     = aws_subnet.public_subnet_1.id
    depends_on = [aws_internet_gateway.internet_gw]
}

resource "aws_nat_gateway" "nat_gw_2" {
    allocation_id = aws_eip.nat_ip_2.id
    subnet_id     = aws_subnet.public_subnet_2.id
    depends_on = [aws_internet_gateway.internet_gw]
}

# Elastic IP Configuration
resource "aws_eip" "nat_ip_1" {
    domain = "vpc"
}

resource "aws_eip" "nat_ip_2" {
    domain = "vpc"
}
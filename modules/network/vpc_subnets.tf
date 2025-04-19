# VPC Configuration
resource "aws_vpc" "main" {
    cidr_block = "10.0.0.0/16"
    
    tags = {
        Name: "my-vpc"
    }
}

# Subnets Configuration
resource "aws_subnet" "private_subnet" {
    vpc_id     = aws_vpc.main.id
    cidr_block = "10.0.0.0/24"

    tags = {
        Name = "Private Subnet"
    }
}

resource "aws_subnet" "public_subnet" {
    vpc_id     = aws_vpc.main.id
    cidr_block = "10.0.1.0/24"
    map_public_ip_on_launch = true

    tags = {
        Name = "Public Subnet"
    }
}
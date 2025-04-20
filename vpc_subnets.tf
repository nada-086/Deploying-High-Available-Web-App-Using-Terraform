# VPC Configuration
resource "aws_vpc" "main" {
    cidr_block = "10.0.0.0/16"
    
    tags = {
        Name: "my-vpc"
    }
}

# Subnets Configuration
## Private Subnets
resource "aws_subnet" "private_subnet_1" {
    vpc_id     = aws_vpc.main.id
    cidr_block = "10.0.10.0/24"
    availability_zone = "us-east-1a"
    tags = {
        Name = "Private Subnet 1"
    }
}

resource "aws_subnet" "private_subnet_2" {
    vpc_id     = aws_vpc.main.id
    cidr_block = "10.0.20.0/24"
    availability_zone = "us-east-1b"
    tags = {
        Name = "Private Subnet 2"
    }
}


## Public Subnets
resource "aws_subnet" "public_subnet_1" {
    vpc_id     = aws_vpc.main.id
    cidr_block = "10.0.100.0/24"
    availability_zone = "us-east-1a"
    map_public_ip_on_launch = true

    tags = {
        Name = "Public Subnet 1"
    }
}

resource "aws_subnet" "public_subnet_2" {
    vpc_id     = aws_vpc.main.id
    cidr_block = "10.0.200.0/24"
    availability_zone = "us-east-1b"
    map_public_ip_on_launch = true

    tags = {
        Name = "Public Subnet 2"
    }
}
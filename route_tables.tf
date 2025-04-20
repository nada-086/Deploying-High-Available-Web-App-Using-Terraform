# Route Table for Subnet 1
resource "aws_route_table" "private_rt_1" {
    vpc_id = aws_vpc.main.id

    route {
        cidr_block     = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.nat_gw_1.id
    }
}

resource "aws_route_table_association" "private_1" {
    subnet_id      = aws_subnet.private_subnet_1.id
    route_table_id = aws_route_table.private_rt_1.id
}

# Route Table for Subnet 2
resource "aws_route_table" "private_rt_2" {
    vpc_id = aws_vpc.main.id

    route {
        cidr_block     = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.nat_gw_2.id
    }
}

resource "aws_route_table_association" "private_2" {
    subnet_id      = aws_subnet.private_subnet_2.id
    route_table_id = aws_route_table.private_rt_2.id
}

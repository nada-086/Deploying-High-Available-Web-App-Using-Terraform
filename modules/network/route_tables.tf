resource "aws_route_table" "route_table" {
    vpc_id = aws_vpc.main.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.internet_gw.id
    }
}

resource "aws_route_table_association" "subnet_ass" {
    subnet_id      = aws_subnet.private_subnet.id
    route_table_id = aws_route_table.route_table.id
}
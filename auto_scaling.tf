resource "aws_launch_template" "webserver" {
    name_prefix   = "webserver"
    image_id = "ami-0e449927258d45bc4"
    instance_type = "t2.micro"
    vpc_security_group_ids = [aws_security_group.http_sg.id]
    tags = {
        Name: "Web Server"
    }
    user_data = base64encode(<<EOF
        #!/bin/bash
        sudo yum install httpd -y
        sudo systemctl enable httpd
        echo "Server 1: This is from Terraform Configuration" >> /var/www/html/index.html
        sudo systemctl start httpd
        EOF
    )
}

resource "aws_autoscaling_group" "auto_scaling_group" {
    vpc_zone_identifier = [aws_subnet.private_subnet_1.id, aws_subnet.private_subnet_2.id]
    desired_capacity   = 4
    max_size           = 4
    min_size           = 2

    launch_template {
        id      = aws_launch_template.webserver.id
        version = "$Latest"
    }
    target_group_arns = [aws_lb_target_group.app_tg.arn]
}
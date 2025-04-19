resource "aws_instance" "webserver" {
    subnet_id = var.private_subnet_id
    ami = "ami-0e449927258d45bc4"
    instance_type = "t2.micro"
    tags = {
        Name = "Web Server"
    }
    user_data = <<EOF
    #!/bin/bash
    sudo yum install httpd -y
    echo "This is from Terraform Configuration" >> /var/www/html/index.html
    sudo systemctl enable --now httpd
    EOF
}
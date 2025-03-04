resource "aws_instance" "practice" {
    ami = "ami-09c813fb71547fc4f"
    instance_type = "t2.micro"
    vpc_security_group_ids = [aws_security_group.allowing_all.id]

    tags = {
        Name = "sivasai-ec2"
    }
}


resource "aws_security_group" "allowing_all" {
    name = "allowing_all"
    description = "allowing all inbound and outbouund rules"

    dynamic "ingress" {
        for_each = var.ingress_ports
        content {
            from_port = ingress.value["from_port"]
            to_port     = ingress.value["to_port"]
            protocol    = ingress.value["protocol"]
            cidr_blocks = ingress.value["cidr_blocks"]
        }
    }


    /* ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port = 8080
        to_port = 8080
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port = 3306
        to_port = 3306
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    } */

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "sivasai-sg"
    }
}
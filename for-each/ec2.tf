resource "aws_instance" "practice" {
    for_each = var.instances
    ami = "ami-09c813fb71547fc4f"
    instance_type = each.value 
    vpc_security_group_ids = [aws_security_group.allowing_all.id]

    tags = {
        Name = each.key
    }
}


resource "aws_security_group" "allowing_all" {
    name = "allowing_all"
    description = "allowing all inbound and outbouund rules"
    ingress {
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
    }

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


output "ec2-info" {
  value       = aws_instance.practice
}

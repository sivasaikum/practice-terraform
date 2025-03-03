resource "aws_instance" "example" {
    ami = local.ami_name
    instance_type = local.instance_type
    vpc_security_group_ids = [aws_security_group.allowing_all.id]

    tags = {
        Name = local.tag_name
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
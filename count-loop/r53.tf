resource "aws_route53_record" "expense" {
    count = length(var.instances)
    zone_id = var.zone_id
    name = "${var.instances[count.index]}.${var.domain}"
    type = "A"
    ttl = 1
    records = [aws_instance.practice[count.index].private_ip]
    allow_overwrite = true
}


resource "aws_route53_record" "web" {
    zone_id = var.zone_id
    name = var.domain
    type = "A"
    ttl = 1
    records = [aws_instance.practice[2].public_ip]
    allow_overwrite = true
}
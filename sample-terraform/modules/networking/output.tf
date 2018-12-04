output "vpc_id" {
  value = "${aws_vpc.vpc.id}"
}

output "public_subnet_id" {
  value = "${aws_subnet.public_subnet.id}"
}

output "private_subnet_id" {
  value = "${aws_subnet.private_subnet.id}"
}

output "default_sg_id" {
  value = "${aws_security_group.default.id}"
}

output "web_sg_id" {
  value = "${aws_security_group.web_inbound_sg.id}"
}

output "db_sg_id" {
  value = "${aws_security_group.db_inbound_sg.id}"
}

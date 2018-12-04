output "vpc_id" {
  value = "${module.networking.vpc_id}"
}

output "public_subnet_id" {
  value = "${module.networking.public_subnet_id}"
}

output "private_subnet_id" {
  value = "${module.networking.private_subnet_id}"
}

output "web_sg_id" {
  value = "${module.networking.web_sg_id}"
}

output "db_sg_id" {
  value = "${module.networking.db_sg_id}"
}

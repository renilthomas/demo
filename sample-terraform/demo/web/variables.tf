variable "environment" {
  default = "demo"
}

variable "key_name" {
  description = "The aws keypair to use"
}

variable "region" {
  description = "Region that the instances will be created"
}

variable "vpc_cidr" {
  description = "The CIDR block of the VPC"
}

variable "web_sg_id" {
  description = "The web server security group from the vpc"
}

variable "db_sg_id" {
  description = "The db server security group from the vpc"
}

variable "private_subnet_id" {
  description = "The id of the private subnet to launch the instances"
}

variable "public_subnet_id" {
  description = "The id of the public subnet to launch the load balancer"
}

variable "vpc_id" {
  description = "The id of the vpc"
}


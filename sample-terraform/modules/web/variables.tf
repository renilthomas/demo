variable "region" {
  description = "The region to launch the instances"
}

variable "amis" {
  default = {
    us-east-1 = "ami-b73b63a0"
    us-west-2 = "ami-5ec1673e"
    eu-west-1 = "ami-9398d3e0"
  }
}

variable "instance_type" {
  description = "The instance type to launch"
}

variable "private_subnet_id" {
  description = "The id of the private subnet to launch the instances"
}

variable "public_subnet_id" {
  description = "The id of the public subnet to launch the load balancer"
}

variable "web_sg_id" {
  description = "The web server security group from the vpc"
}

variable "db_sg_id" {
  description = "The db server security group from the vpc"
}

variable "key_name" {
  description = "The keypair to use on the instances"
}

variable "environment" {
  description = "The environment for the instance"
}

variable "vpc_id" {
  description = "The id of the vpc"
}

variable "DnsZoneName" {
  description = "The internal route53 hosted zone name"
  default     = "demo.internal"
}



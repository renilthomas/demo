variable "vpc_cidr" {
  description = "The CIDR block of the VPC"
}

variable "public_subnet_cidr" {
  description = "The CIDR block for the public subnet"
}

variable "private_subnet_cidr" {
  description = "The CIDR block for the private subnet"
}

variable "environment" {
  description = "The environment"
}

variable "region" {
  description = "The region to launch the bastion host"
}

variable "availability_zone" {
  description = "The az that the resources will be launched"
}

variable "bastion_ami" {
  default = {
    us-east-1 = "ami-b73b63a0"
    us-west-2 = "ami-5ec1673e"
    eu-west-1 = "ami-9398d3e0"
  }
}

variable "key_name" {
  description = "The public key for the bastion host"
}

variable "DnsZoneName" {
  description = "The internal route53 hosted zone name"
  default     = "demo.internal"
}

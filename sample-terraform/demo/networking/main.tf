terraform {
  required_version = ">= 0.11"
   
  backend "s3" {
  region          = "us-east-1"
  bucket          = "demo-tf-remote"
  key             = "networking/terraform.tfstate"
  lock_table      = "tf_lock"
  encrypt         = "true"
  } 
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_key_pair" "key" {
  key_name   = "${var.key_name}"
  public_key = "${file("staging_key.pub")}"
}
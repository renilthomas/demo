/* Web server */
resource "aws_instance" "web" {
  ami                     = "${lookup(var.amis, var.region)}"
  instance_type           = "${var.instance_type}"
  key_name                = "${var.key_name}"
  subnet_id               = "${var.private_subnet_id}"
  vpc_security_group_ids  = ["${var.web_sg_id}"]
  user_data               = "${file("${path.module}/files/user_web_data.sh")}"
  tags                    = {
    Name        = "${var.environment}-web"
    Environment = "${var.environment}"
  }
}

/* DB server */

resource "aws_instance" "database" {
  ami               = "${lookup(var.amis, var.region)}"
  instance_type     = "${var.instance_type}"
  key_name          = "${var.key_name}"
  subnet_id         = "${var.private_subnet_id}"
  vpc_security_group_ids = [
    "${var.db_sg_id}"
  ]
  user_data         = "${file("${path.module}/files/user_db_data.sh")}"
  tags = {
    Name        = "${var.environment}-db"
    Environment = "${var.environment}"
  }
}

/* DNS PART ZONE AND RECORDS */
resource "aws_route53_zone" "main" {
  name = "${var.DnsZoneName}"
  vpc_id = "${var.vpc_id}"
  comment = "Managed by terraform"
}

resource "aws_route53_record" "database" {
   zone_id = "${aws_route53_zone.main.zone_id}"
   name = "mydb.${var.DnsZoneName}"
   type = "A"
   ttl = "300"
   records = ["${aws_instance.database.private_ip}"]
}

/* Load Balancer */
resource "aws_elb" "web" {
  name            = "${var.environment}-web-lb"
  subnets         = ["${var.public_subnet_id}"]
  security_groups = ["${var.web_sg_id}"]

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }
  instances = ["${aws_instance.web.id}"]

  tags {
    Environment = "${var.environment}"
  }
}
module "web" {
  source                  = "../../modules/web"
  region                  = "${var.region}"
  instance_type           = "t2.micro"
  private_subnet_id       = "${var.private_subnet_id}"
  public_subnet_id        = "${var.public_subnet_id}"
  web_sg_id               = "${var.web_sg_id}"
  db_sg_id                = "${var.db_sg_id}"
  key_name                = "${var.key_name}"
  environment             = "${var.environment}"
  vpc_id                  = "${var.vpc_id}"  
}
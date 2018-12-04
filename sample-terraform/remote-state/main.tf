##
# Terraform State S3 bucket
##
resource "aws_s3_bucket" "tf-state" {
  bucket = "demo-tf-remote"
  tags {
    Name        = "${var.environment}-s3"
    Environment = "${var.environment}"
  }

  versioning {
    enabled = true
  }
}

##
# Terraform lock table
##
resource "aws_dynamodb_table" "statefile_lock" {
  name = "${var.lock_table_name}"

  read_capacity  = "${var.lock_table_read_capacity}"
  write_capacity = "${var.lock_table_write_capacity}"

  hash_key = "LockID"

  attribute = {
    name = "LockID"
    type = "S"
  }

  tags {
    Name        = "${var.environment}-dynamodb"
    Environment = "${var.environment}"
  }

  lifecycle {
    prevent_destroy = true
  }
}


output "table-arn" {
  value = "${aws_dynamodb_table.statefile_lock.arn}"
}

output "bucket-name" {
  value = "${aws_s3_bucket.tf-state.id}"
}

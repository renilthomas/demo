variable "lock_table_name" {
  type    = "string"
  default = "tf_lock"
}

variable "lock_table_read_capacity" {
  type        = "string"
  description = "DynamoDB read capacity for the lock table."
  default     = 10
}

variable "lock_table_write_capacity" {
  type        = "string"
  description = "DynamoDB write capacity for the lock table."
  default     = 10
}

variable "environment" {
  description = "The environment"
}

variable "aws_region" {
  description = "AWS region used by floci"
  type        = string
  default     = "us-east-1"
}

variable "todo_bucket_name" {
  description = "s3 bucket for the todo application"
  type        = string
  default     = "todo-app-terraform"
}

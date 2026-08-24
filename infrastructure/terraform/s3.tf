resource "aws_s3_bucket" "todo_bucket" {
  bucket = var.todo_bucket_name
}
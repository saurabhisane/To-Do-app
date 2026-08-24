output "todo_bucket_name" {
  description = "Name of the To-Do S3 bucket"
  value       = aws_s3_bucket.todo_bucket.bucket
}

output "ecr_repository_name" {
  description = "Name of the To-Do ECR repository"
  value       = aws_ecr_repository.todo_app.name
}

output "ecr_repository_url" {
  description = "URL of the To-Do ECR repository"
  value       = aws_ecr_repository.todo_app.repository_url
}

output "dynamodb_users_table_name" {
  value = aws_dynamodb_table.todo_users.name
}

output "dynamodb_todos_table_name" {
  value = aws_dynamodb_table.todo_items.name
}
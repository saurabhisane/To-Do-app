resource "aws_dynamodb_table" "todo_users" {
  name         = "TodoUsers"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "email"

  attribute {
    name = "email"
    type = "S"
  }
  tags = {
    Name        = "TodoUsers"
    environment = "dev"
    project     = "todo-app"
  }
}


resource "aws_dynamodb_table" "todo_items" {
  name         = "TodoItems"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "userId"
  range_key    = "todoId"

  attribute {
    name = "userId"
    type = "S"
  }
  attribute {
    name = "todoId"
    type = "S"
  }
  tags = {
    Name        = "TodoItems"
    environment = "dev"
    project     = "todo-app"
  }
}
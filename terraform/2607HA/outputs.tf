output "table_name" {
  value = aws_dynamodb_table.product_catalog.name
}

output "table_arn" {
  value = aws_dynamodb_table.product_catalog.arn
}
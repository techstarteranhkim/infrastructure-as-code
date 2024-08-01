variable "aws_region" {
  description = "AWS-Region für die Ressourcen"
  default     = "eu-central-1"
}

variable "table_name" {
  description = "Name der DynamoDB-Tabelle"
  default     = "product_catalog"
}
resource "aws_dynamodb_table" "product_catalog" {
  name         = "ProductCatalog"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "Id"

  attribute {
    name = "Id"
    type = "N"
  }

  attribute {
    name = "Title"
    type = "S"
  }

  attribute {
    name = "InPublication"
    type = "B"
  }

  global_secondary_index {
    name            = "TitleIndex"
    hash_key        = "Title"
    projection_type = "ALL"
  }

  global_secondary_index {
    name            = "InPublicationIndex"
    hash_key        = "InPublication"
    projection_type = "ALL"
  }
}
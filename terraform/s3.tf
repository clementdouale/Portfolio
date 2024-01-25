resource "aws_s3_bucket" "my_portfolio_bucket" {
  bucket = var.bucket_name
}

resource "aws_s3_bucket_website_configuration" "my_portfolio_website" {
  bucket = aws_s3_bucket.my_portfolio_bucket.id

  index_document {
    suffix = var.index_document
  }

  error_document {
    key = var.error_document
  }
}

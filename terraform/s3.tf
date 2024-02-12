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
# S3 bucket ACL access

resource "aws_s3_bucket_ownership_controls" "my_portfolio_website" {
  bucket = aws_s3_bucket.my_portfolio_bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "my_portfolio_website" {
  bucket = aws_s3_bucket.my_portfolio_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true

}

resource "aws_s3_bucket_acl" "my_portfolio_website" {
  depends_on = [
    aws_s3_bucket_ownership_controls.my_portfolio_website,
    aws_s3_bucket_public_access_block.my_portfolio_website,
  ]

  bucket = aws_s3_bucket.my_portfolio_bucket.id
  acl    = "private"
}
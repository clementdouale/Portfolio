variable "region" {
  description = "AWS region to create resources in"
  default     = "ap-northeast-2"
}

variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
}

variable "prefix" {
  type        = string
  description = "The prefix to be added to resource names"
}

variable "domain_name" {
  description = "The domain name for the portfolio"
  type        = string
}

variable "index_document" {
  description = "The index document for the website"
  default     = "index.html"
}

variable "error_document" {
  description = "The error document for the website"
  default     = "error.html"
}

variable "cloudfront_origin_id" {
  description = "The origin ID for CloudFront"
  type        = string
}

variable "cloudfront_comment" {
  description = "The comment for the CloudFront origin access identity"
  type        = string
}

variable "cloudfront_price_class" {
  description = "The price class for the CloudFront distribution"
  default     = "PriceClass_200"
}

provider "aws" {
  region = "us-east-1"
}

# Create S3 bucket
resource "aws_s3_bucket" "website" {
  bucket = "ecommerce-devops-demo-site-12345"  # must be globally unique
}

# Make bucket objects publicly readable
resource "aws_s3_bucket_acl" "website" {
  bucket = aws_s3_bucket.website.id
  acl    = "public-read"
}

# Configure bucket for website hosting
resource "aws_s3_bucket_website_configuration" "website" {
  bucket = aws_s3_bucket.website.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}

# Remove public access blocks to allow public website
resource "aws_s3_bucket_public_access_block" "website" {
  bucket = aws_s3_bucket.website.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}


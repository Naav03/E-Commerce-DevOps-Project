resource "aws_s3_bucket" "website" {
  bucket = "ecommerce-devops-demo-site"
  acl    = "public-read"

  website {
    index_document = "index.html"
  }
}

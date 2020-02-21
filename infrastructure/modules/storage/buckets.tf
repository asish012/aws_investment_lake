resource "aws_s3_bucket" "s3_bucket" {
  bucket = var.bucket_name
  acl    = "private"
  force_destroy = true
  versioning {
      enabled = true
  }
  tags = {
      Name = var.tag_name
  }
}

resource "aws_s3_bucket" "b" {
  bucket = "hikaru515-tf-test-bucket"
  acl    = "private"

  tags = {
    Name        = "My Bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_public_access_block" "b" {
  bucket                  = aws_s3_bucket.b.id
  block_public_acls       = true
  block_public_policy     = true
  restrict_public_buckets = true
  ignore_public_acls      = true
}

resource "aws_s3_bucket_object" "o" {
  for_each = fileset("../../s3/", "*")
  bucket   = aws_s3_bucket.b.id
  key      = each.value
  source   = "../../s3/${each.value}"
  etag     = filemd5("../../s3/${each.value}")
}

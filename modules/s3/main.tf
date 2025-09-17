resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name
  acl    = "private"

  tags = { Name = "project29-s3" }
}

output "bucket_name" {
  value = aws_s3_bucket.bucket.bucket
}

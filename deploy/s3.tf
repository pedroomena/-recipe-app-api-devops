resource "aws_s3_bucket" "app_public_files" {
  bucket_prefix = "${local.prefix}-files"
  force_destroy = true
}

resource "aws_s3_bucket_ownership_controls" "app_public_files" {
  bucket = aws_s3_bucket.app_public_files.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "app_public_files" {
  bucket = aws_s3_bucket.app_public_files.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_acl" "app_public_files" {
  depends_on = [
    aws_s3_bucket_ownership_controls.app_public_files,
    aws_s3_bucket_public_access_block.app_public_files,
  ]

  bucket = aws_s3_bucket.app_public_files.id
  acl    = "public-read"
}

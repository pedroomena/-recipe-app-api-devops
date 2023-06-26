resource "aws_s3_bucket" "app_public_files" {
  bucket_prefix = "${local.prefix}-files"
  acl           = "private" # todo: change me after the course
  force_destroy = true
}
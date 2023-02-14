resource "aws_s3_bucket" "bucket" {
  bucket        = var.bucket_name
  force_destroy = var.force_destroy
  tags          = local.merged_tags
}

resource "aws_s3_bucket_public_access_block" "public_access" {
  bucket = aws_s3_bucket.bucket.id

  block_public_acls       = var.restrict_public_access
  block_public_policy     = var.restrict_public_access
  ignore_public_acls      = var.restrict_public_access
  restrict_public_buckets = var.restrict_public_access
}

resource "aws_s3_bucket_acl" "acl" {
  count = var.acl != null && var.object_ownership != "BucketOwnerEnforced" ? 1 : 0

  bucket = aws_s3_bucket.bucket.id
  acl    = var.acl
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.bucket.id
  versioning_configuration {
    status = var.versioning
  }
}

resource "aws_s3_bucket_policy" "policy" {
  count  = var.policy == null ? 0 : 1
  bucket = aws_s3_bucket.bucket.id
  policy = var.policy
}

resource "aws_s3_bucket_ownership_controls" "ownership_controls" {
  bucket = aws_s3_bucket.bucket.id

  rule {
    object_ownership = var.object_ownership
  }
}

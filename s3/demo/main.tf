provider "aws" {
  region = "us-west-2"
}

module "demo_s3_bucket" {
  source = "../"
  stage                  = "test"
  project_name           = "tf-s3-module-demo"
  bucket_name            = "tf-s3-module-demo-bucket-name"
  force_destroy          = false
  versioning             = "Disabled"
  acl                    = "private"
  object_ownership       = "BucketOwnerEnforced"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action    = [
          "s3:GetObject",
          "s3:ListBucket",
          "s3:PutObject",
          "s3:DeleteObject"
        ]
        Effect    = "Allow"
        Principal = {
            "AWS": [
              "arn:aws:iam::{replace-with-aws-account-id}:root"
            ]
          }
        Resource = [
          "arn:aws:s3:::tf-s3-module-demo-bucket-name",
          "arn:aws:s3:::tf-s3-module-demo-bucket-name/*"
        ]
      },
    ]
  })

  tags = {
    stage = "test"
    resource = "s3"
  }
}

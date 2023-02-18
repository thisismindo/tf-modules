terraform {
  required_version = ">= 1.3.7"

  backend "s3" {
    key        = "<S3_BUCKET>/dev-demo.tf"
    bucket     = "<S3_BUCKET>"
    region     = "<AWS_REGION>"
    encrypt    = true
    kms_key_id = "<KMS_KEY_ID>"
    acl        = "bucket-owner-full-control"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.54.0"
    }
  }
}

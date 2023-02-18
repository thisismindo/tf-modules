provider "aws" {
  region = "<AWS_REGION>"
}

module "demo_msk_cluster" {
  source              = "../"
  environment         = "dev"
  aws_region          = "<AWS_REGION>"
  aws_account_name    = "<AWS_ACCOUNT_NAME>"
  s3_bucket_name      = "<S3_BUCKET>"
}

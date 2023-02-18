variable "environment" {
  description = "resource environment"
  type        = string
  default     = ""
}

variable "aws_region" {
  description = "msk region"
  type        = string
  default     = ""
}

variable "aws_account_name" {
  description = "account name"
  type        = string
  default     = ""
}

variable "cluster_name" {
  description = "msk cluster name"
  type        = string
  default     = "aws-msk-demo"
}

variable "kafka_version" {
  description = "kafka version"
  type        = string
  default     = "3.3.1"
}

variable "number_of_broker_nodes" {
  description = "number of nodes in msk cluster"
  type        = number
  default     = 3
}

variable "instance_type" {
  description = "broker instance type"
  type        = string
  default     = "kafka.t3.small"
}

variable "ebs_volume_size" {
  description = "ebs volume size"
  type        = number
  default     = 5
}

variable "tags" {
  description = "resource tags"
  type        = map(string)
  default     = {}
}

variable "cloudwatch_retention_in_days" {
  description = "cwl retention"
  type        = number
  default     = 1
}

variable "s3_bucket_name" {
  description = "s3 bucket name"
  type        = string
  default     = ""
}

variable "s3_vpc_tfstate" {
  description = "s3 object name for vpc"
  type        = string
  default     = "demo-msk-vpc.tfstate"
}

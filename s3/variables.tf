variable "bucket_name" {
  description = "S3 bucket name. It should be unique globally."
  type        = string
}

variable "project_name" {
  description = "Project name."
  type        = string
}

variable "force_destroy" {
  description = "Force destroy."
  type        = bool
  default     = false
}

variable "stage" {
  description = "S3 stage e.g. test, dev, qa, staging, production."
  type        = string
}

variable "restrict_public_access" {
  description = "Restrict public access to s3 bucket."
  type        = bool
  default     = true
}

variable "tags" {
  description = "Resource tag(s)."
  type        = map(string)
  default     = {}
}

variable "versioning" {
  description = "Enable versioning of objects"
  type        = string
  default     = "Suspended"

  validation {
    condition     = contains(["Suspended", "Enabled", "Disabled"], var.versioning)
    error_message = "Accepted validation values are Suspended, Enabled, and Unversioned."
  }
}

variable "acl" {
  description = "Manage access to S3 buckets and objects."
  type        = string
  default     = null
}

variable "policy" {
  description = "S3 bucket policy."
  type        = string
  default     = null
}

variable "object_ownership" {
  description = "S3 bucket object ownership"
  type        = string
  default     = "BucketOwnerEnforced"
}

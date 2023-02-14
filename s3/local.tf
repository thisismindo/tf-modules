locals {
  default_tags = {
    Terraform   = "true"
    projectName = var.project_name
    stage       = var.stage
  }
  merged_tags = merge(local.default_tags, var.tags)
}

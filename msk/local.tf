locals {
  common_tags = {
    environment = var.environment
    resource    = "msk"
  }

  tags = merge(var.tags, local.common_tags)
}

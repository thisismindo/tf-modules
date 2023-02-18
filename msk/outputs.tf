output "cluster_arn" {
  description = "arn of the msk cluster"
  value       = join("", aws_msk_cluster.msk_cluster.*.arn)
}

output "cluster_name" {
  description = "msk cluster name"
  value       = join("", aws_msk_cluster.msk_cluster.*.cluster_name)
}

output "bootstrap_brokers" {
  description = "a comma separated list of one or more hostname:port pairs of kafka brokers suitable to boostrap connectivity to the kafka cluster"
  value       = join(",", aws_msk_cluster.msk_cluster.*.bootstrap_brokers)
}

output "bootstrap_brokers_tls" {
  description = "a comma separated list of one or more dns names and tls port pairs kafka brokers suitable to boostrap connectivity to the kafka cluster"
  value       = join(",", aws_msk_cluster.msk_cluster.*.bootstrap_brokers_tls)
}

output "bootstrap_brokers_scram" {
  description = "a comma separated list of one or more dns names and tls port pairs kafka brokers suitable to boostrap connectivity using sasl/scram to the kafka cluster."
  value       = join(",", aws_msk_cluster.msk_cluster.*.bootstrap_brokers_sasl_scram)
}

output "bootstrap_brokers_iam" {
  description = "a comma separated list of one or more dns names and tls port pairs kafka brokers suitable to boostrap connectivity using sasl/iam to the kafka cluster."
  value       = join(",", aws_msk_cluster.msk_cluster.*.bootstrap_brokers_sasl_iam)
}

output "zookeeper_connect_string" {
  description = "a comma separated list of one or more hostname:port pairs to use to connect to the Apache Zookeeper cluster"
  value       = join(",", aws_msk_cluster.msk_cluster.*.zookeeper_connect_string)
}

output "config_arn" {
  description = "ARN of MSK cluster configuration"
  value       = join("", aws_msk_configuration.msk_cluster_config.*.arn)
}

resource "aws_cloudwatch_log_group" "msk_cwl" {
  name = "${var.environment}-${var.cluster_name}-brokers"
  retention_in_days = var.cloudwatch_retention_in_days
  tags = local.tags
}

resource "aws_msk_configuration" "msk_cluster_config" {
  count             = 1
  kafka_versions    = ["${var.kafka_version}"]
  name              = "${var.cluster_name}-config"

  server_properties = <<PROPERTIES
auto.create.topics.enable = true
delete.topic.enable = false
PROPERTIES
}

resource "aws_msk_cluster" "msk_cluster" {
  cluster_name            = "${var.environment}-${var.cluster_name}"
  kafka_version           = "${var.kafka_version}"
  number_of_broker_nodes  = var.number_of_broker_nodes

  broker_node_group_info {
    instance_type   = var.instance_type
    client_subnets = [
      aws_subnet.subnet_az1.id,
      aws_subnet.subnet_az2.id,
      aws_subnet.subnet_az3.id,
    ]
    security_groups = [aws_security_group.sg.id]

    storage_info {
      ebs_storage_info {
        volume_size = var.ebs_volume_size
      }
    }
  }

  configuration_info {
    arn = aws_msk_configuration.msk_cluster_config[0].arn
    revision = aws_msk_configuration.msk_cluster_config[0].latest_revision
  }

  client_authentication {
    sasl {
      iam   = true
      scram = true
    }
  }

  logging_info {
    broker_logs {
      cloudwatch_logs {
        enabled   = true
        log_group = aws_cloudwatch_log_group.msk_cwl.name
      }
    }
  }

  open_monitoring {
    prometheus {
      jmx_exporter {
        enabled_in_broker = true
      }
      node_exporter {
        enabled_in_broker = true
      }
    }
  }

  tags = local.tags
}

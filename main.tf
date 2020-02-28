resource "random_string" "kafka_conf" {
  length  = 11
  special = false
}

resource "aws_msk_configuration" "default" {
  kafka_versions = [var.msk_kafka_version]
  name           = "${format("%s-%s-%s-msk-configuration", var.product_name, var.environment, random_string.kafka_conf.result)}"

  server_properties = <<PROPERTIES
${var.msk_server_configuration}
PROPERTIES
}

resource "aws_msk_cluster" "default" {
  configuration_info {
    arn      = aws_msk_configuration.default.arn
    revision = aws_msk_configuration.default.latest_revision
  }
  cluster_name           = "${format("%s-%s-msk", var.product_name, var.environment)}"
  kafka_version          = var.msk_kafka_version
  number_of_broker_nodes = var.msk_number_of_broker_nodes
  tags                   = var.tags
  encryption_info {
    encryption_in_transit {
      client_broker = "TLS_PLAINTEXT"
    }
  }
  broker_node_group_info {
    client_subnets  = var.msk_client_subnets
    security_groups = var.msk_security_groups
    ebs_volume_size = var.msk_ebs_volume_size
    instance_type   = var.msk_instance_type
  }
}

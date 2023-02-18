resource "aws_security_group" "sg" {
  name        = "${var.cluster_name}-${var.environment}-sg"
  description = "allow inbound kafka tls"
  vpc_id      = aws_vpc.vpc.id

  tags = merge(local.tags, {
    Name = "${var.cluster_name}-${var.environment}-sg"
  })

  ingress {
    description = "zookeeper procotol https://docs.aws.amazon.com/msk/latest/developerguide/port-info.html"
    from_port   = 2181
    to_port     = 2182
    protocol    = "tcp"
  }

  ingress {
    description = "kafka protocols. see https://docs.aws.amazon.com/msk/latest/developerguide/port-info.html"
    from_port   = 9092
    to_port     = 9096
    protocol    = "tcp"
  }

  egress {
    description = "allow outbound traffic without restriction"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

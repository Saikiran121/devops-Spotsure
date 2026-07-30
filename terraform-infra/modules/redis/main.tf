resource "aws_elasticache_subnet_group" "this" {
  count      = var.enable_redis ? 1 : 0
  name       = "${var.project_name}-redis-subnets"
  subnet_ids = var.private_subnet_ids
}

resource "aws_elasticache_replication_group" "this" {
  count = var.enable_redis ? 1 : 0

  replication_group_id = "${var.project_name}-redis"
  description          = "Shared Redis pub/sub broker for cross-instance chat broadcast"
  engine               = "redis"
  engine_version       = "7.1"
  node_type            = var.node_type
  port                 = 6379
  parameter_group_name = "default.redis7"

  num_cache_clusters         = 2
  automatic_failover_enabled = true
  multi_az_enabled           = true

  subnet_group_name  = aws_elasticache_subnet_group.this[0].name
  security_group_ids = [var.redis_sg_id]

  at_rest_encryption_enabled = true
  transit_encryption_enabled = false # keep false unless your client lib supports TLS - avoids surprise conn failures

  tags = {
    Name = "${var.project_name}-redis"
  }
}

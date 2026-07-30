output "primary_endpoint" {
  value = var.enable_redis ? aws_elasticache_replication_group.this[0].primary_endpoint_address : ""
}

output "reader_endpoint" {
  value = var.enable_redis ? aws_elasticache_replication_group.this[0].reader_endpoint_address : ""
}

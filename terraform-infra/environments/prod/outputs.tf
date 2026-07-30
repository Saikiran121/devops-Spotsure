output "alb_dns_name" {
  description = "Point your Hostinger A/CNAME record for saikbiradar.in at this (as a CNAME/ALIAS, ALB has no static IP)"
  value       = module.alb.alb_dns_name
}

output "asg_name" {
  value = module.asg.asg_name
}

output "redis_primary_endpoint" {
  value = module.redis.primary_endpoint
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

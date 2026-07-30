variable "aws_region" {
  description = "AWS region to deploy into"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Short name used to prefix/tag all resources"
  type        = string
  default     = "spotsure-chat"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.20.0.0/16"
}

variable "availability_zones" {
  description = "AZs to spread subnets across (min 2 for HA)"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}

variable "public_subnet_cidrs" {
  type    = list(string)
  default = ["10.20.0.0/24", "10.20.1.0/24"]
}

variable "private_subnet_cidrs" {
  type    = list(string)
  default = ["10.20.10.0/24", "10.20.11.0/24"]
}

variable "single_nat_gateway" {
  description = "true = 1 NAT GW (cheaper, single AZ egress point). false = 1 NAT GW per AZ (fully HA egress, costs more)"
  type        = bool
  default     = false
}

variable "domain_name" {
  description = "Primary domain for the chat app (must be validated via DNS records you add at your registrar, e.g. Hostinger)"
  type        = string
  default     = "saikbiradar.in"
}

variable "monitoring_domain_name" {
  description = "Domain for Grafana monitoring dashboard (optional, leave blank to skip)"
  type        = string
  default     = "monitoring.saikbiradar.in"
}

variable "instance_type" {
  description = "EC2 instance type for the app servers"
  type        = string
  default     = "t3.small"
}

variable "key_pair_name" {
  description = "Existing EC2 key pair name for emergency SSH access (SSM Session Manager is the primary access path, this is a fallback). Leave null to disable SSH entirely."
  type        = string
  default     = null
}

variable "admin_cidr" {
  description = "CIDR allowed to SSH into instances (only used if key_pair_name is set). Restrict this to your IP, never 0.0.0.0/0."
  type        = string
  default     = "0.0.0.0/0"
}

variable "asg_min_size" {
  type    = number
  default = 1
}

variable "asg_desired_capacity" {
  type    = number
  default = 2
}

variable "asg_max_size" {
  type    = number
  default = 4
}

variable "cpu_target_tracking_value" {
  description = "Target average CPU utilization (%) for the auto scaling target tracking policy"
  type        = number
  default     = 70
}

variable "git_repo_url" {
  description = "Repo the instances will pull the app from on boot"
  type        = string
  default     = "https://github.com/Saikiran121/devops-Spotsure.git"
}

variable "git_branch" {
  type    = string
  default = "main"
}

variable "redis_node_type" {
  description = "ElastiCache node type for the shared Redis pub/sub broker"
  type        = string
  default     = "cache.t3.micro"
}

variable "enable_redis" {
  description = "Provision a shared ElastiCache Redis replication group for cross-instance pub/sub"
  type        = bool
  default     = true
}

variable "existing_certificate_arn" {
  description = "ARN of an already-issued, already-validated ACM certificate to attach to the ALB listener, instead of having Terraform request/validate a new one"
  type        = string
}

variable "project_name" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "key_pair_name" {
  type    = string
  default = null
}

variable "app_sg_id" {
  type = string
}

variable "private_subnet_ids" {
  type = list(string)
}

variable "target_group_arn" {
  type = string
}

variable "asg_min_size" {
  type = number
}

variable "asg_desired_capacity" {
  type = number
}

variable "asg_max_size" {
  type = number
}

variable "cpu_target_tracking_value" {
  type = number
}

variable "git_repo_url" {
  type = string
}

variable "git_branch" {
  type = string
}

variable "redis_endpoint" {
  description = "Shared ElastiCache endpoint, empty string if redis is disabled"
  type        = string
  default     = ""
}

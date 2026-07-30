variable "project_name" {
  type = string
}

variable "enable_redis" {
  type = bool
}

variable "node_type" {
  type = string
}

variable "private_subnet_ids" {
  type = list(string)
}

variable "redis_sg_id" {
  type = string
}

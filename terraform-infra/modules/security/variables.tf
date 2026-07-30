variable "project_name" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "key_pair_name" {
  type    = string
  default = null
}

variable "admin_cidr" {
  type    = string
  default = "0.0.0.0/0"
}

variable "project_name" {
  type = string
}

variable "domain_name" {
  type = string
}

variable "subject_alternative_names" {
  type    = list(string)
  default = []
}

variable "wait_for_validation" {
  description = "Set true only after you've added the DNS validation CNAME records at your registrar - terraform will then block until ACM confirms validation"
  type        = bool
  default     = false
}

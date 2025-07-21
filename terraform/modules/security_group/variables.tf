

variable "vpc_id" {
  description = "VPC ID for security group"
  type        = string
}

variable "environment" {
  description = "Environment name (dev/qa/prod)"
  type        = string
}

variable "ingress_rules" {
  description = "List of ingress rules"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    #cidr_blocks = list(string)
  }))
  default = []
}
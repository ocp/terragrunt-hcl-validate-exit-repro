terraform {
  required_version = "~> 1.11"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.95.0"
    }
  }
}

variable "environment" {
  type = string
}

variable "non_existent" {
  type = string
}

resource "null_resource" "this" {
  triggers = {
    environment  = var.environment
    non_existent = var.non_existent
  }
}

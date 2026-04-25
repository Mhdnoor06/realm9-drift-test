terraform {
  required_version = ">= 1.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

variable "project_name" {
  type    = string
  default = "drift-test"
}

resource "aws_s3_bucket" "starter_bucket" {
  bucket = "realm9-drift-test-${var.environment}"
  tags = {
    Name        = "starter-bucket"
    Environment = var.environment
    Project     = var.project_name
  }
}

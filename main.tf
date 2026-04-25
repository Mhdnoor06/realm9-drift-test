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

resource "aws_sqs_queue" "drift_probe_queue" {
  name = "realm9-drift-queue-${var.environment}"

  tags = {
    Name        = "drift-probe-queue"
    Environment = var.environment
    Project     = var.project_name
  }
}

resource "aws_dynamodb_table" "drift_probe" {
  name         = "realm9-drift-probe-${var.environment}"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "id"

  attribute {
    name = "id"
    type = "S"
  }

  tags = {
    Name        = "drift-probe"
    Environment = var.environment
    Project     = var.project_name
  }
}
# drift-retest 2026-04-25T19:43:47
# drift-retest-fix 2026-04-25T19:44:51
# post-restart-drift-check 2026-04-25T20:44:20

terraform {
  required_providers {
    aws = {
      version = "~>5.5.0"
    }
  }

  backend "s3" {
    bucket         = "recipe-app-devops-tfstate"
    key            = "recipe-app.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "recipe-app-api-devops-tf-state-lock"
  }
}

provider "aws" {
  region = "us-east-1"
}

locals {
  prefix = "${var.prefix}-${terraform.workspace}"
  common_tags = {
    Environment = terraform.workspace
    Project     = var.project
    Owner       = var.contact
    ManagedBy   = "Terraform"
  }
  subdomain = {
    production = var.prefix
    staging    = "${var.prefix}.staging"
    dev        = "${var.prefix}.dev"
  }
}

data "aws_region" "current" {}

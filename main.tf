terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
  default_tags {
    tags = {
      Project     = var.project_name
      Environment = terraform.workspace
    }
  }
}

module "vpc" {
  source         = "./modules/networking"
  project_name   = var.project_name
  vpc_cidr_block = var.vpc_cidr_block
  subnet_azs     = var.subnet_azs
}

module "ec2" {
  source           = "./modules/servers"
  project_name     = var.project_name
  vpc_id           = module.vpc.vpc_id
  ssh_allowed_cidr = var.ssh_allowed_cidr
}

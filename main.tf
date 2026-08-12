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
  region = var.region
  default_tags {
    tags = local.tags
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
  subnet_ids       = module.vpc.private_subnet_ids
  asg = {
    tags = local.tags
  }
}

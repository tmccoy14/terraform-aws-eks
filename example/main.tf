terraform {
  required_version = ">=0.14.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
  backend "s3" {}
}

provider "aws" {
  region = "us-east-1"
}

module "eks" {
  source  = "tmccoy14/eks/aws"
  version = "0.1.0"

  cluster_name   = "testing-cluster"
  vpc_id         = "vpc-1234abcd"
  nodegroup_name = "testing-nodegroup"
  desired_size   = "1"
  max_size       = "1"
  min_size       = "1"
}

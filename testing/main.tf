terraform {
  required_version = ">=0.14.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
  #   backend "s3" {}
}

# ---------------------------------------------------------------------------------------------------------------------
# PREPARE PROVIDERS
# ---------------------------------------------------------------------------------------------------------------------
provider "aws" {
  region = "us-east-1"
}

module "eks" {
  source  = "tmccoy14/eks/aws"
  version = "0.0.5"

  cluster_role_name = "testing-cluster-role"

  cluster_name = "testing-cluster"
  vpc_id       = "vpc-0e3d264de5c7e8eb5"

  nodegroup_role_name = "testing-nodegroup-role"

  nodegroup_name = "testing-nodegroup"
  desired_size   = "1"
  max_size       = "1"
  min_size       = "1"
}

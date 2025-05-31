provider "aws" {
  region = "ap-northeast-1"
}

terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_prefix.cidr_block
  enable_dns_hostnames = true
  enable_dns_support   = true
}

variable "vpc_prefix" {
  type = object({
    prefix     = string
    cidr_block = string
  })
  default = {
    prefix     = "network"
    cidr_block = "10.0.0.0/16"
  }
}
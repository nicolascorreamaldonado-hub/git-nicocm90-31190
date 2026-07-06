terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.44.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.4.3"
    }
  }
  required_version = "~>1.15.6"

}

provider "aws" {
  # Configuration options
  region = "us-east-1"
  default_tags {
    tags = var.tags
  }
}

provider "aws" {
  # Configuration options
  region = "us-east-2"
  alias  = "ohio"
  default_tags {
    tags = var.tags
  }
}
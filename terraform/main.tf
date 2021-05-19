terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_lightsail_instance" "api_flask_test" {
  name              = "flask-from-mac"
  availability_zone = "us-east-1b"
  blueprint_id      = "cchanta/tecamia-devops:v1.0"
  bundle_id         = "nano_2_0"
}
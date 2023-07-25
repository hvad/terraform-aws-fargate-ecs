terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

resource "aws_ecs_cluster" "my_cluster" {
  name = "my-cluster" # Naming the cluster
}

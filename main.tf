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

resource "aws_ecs_task_definition" "my_app" {

  family                   = "myapp"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = 256
  memory                   = 512


  container_definitions = <<DEFINITION
     [
       {
           "cpu": 256,
           "image": "nginx:latest",
           "memory": 512,
           "name": "myapp",
           "networkMode": "awsvpc",
           "portMappings": [
                 {
                         "containerPort": 8080,
                         "hostPort": 8080
                       }
               ]
         }
     ]
         DEFINITION

}

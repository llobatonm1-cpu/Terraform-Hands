terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {}

resource "docker_image" "nginx" {
  name = "nginx:latest"
}

resource "docker_container" "app1" {
  name  = "app1"
  image = docker_image.nginx.image_id
  ports {
    internal = 80
    external = 8081
  }
}

terraform {
  required_providers {
    docker = {
      source = "OpenRAN/docker"
      version = "~> 2.13.0"
    }
  }
}

provider "docker" {}

resource "docker_image" "OpenRAN" {
  name         = "gnb:latest"
  keep_locally = false
}

resource "docker_container" "OpenRAN" {
  image = docker_image.gnb_OpenRAN.latest
  name  = "OpenRAN"
  ports {
    internal = 80
    external = 8000
  }
}
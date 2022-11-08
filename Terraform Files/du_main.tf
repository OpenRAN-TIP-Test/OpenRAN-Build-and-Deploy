terraform {
  required_providers {
    docker = {
      source = "OpenRAN/docker"
      version = "~> 2.5.0"
    }
  }
}

provider "docker" {}

resource "docker_image" "du_OpenRAN" {
  name         = "duOpenRAN:latest"
  keep_locally = false
}

resource "docker_container" "du_OpenRAN" {
  image = docker_image.du_OpenRAN.latest
  name  = "du_cnf"
  ports {
    internal = 80
    external = 8000
  }
}
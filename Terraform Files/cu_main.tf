terraform {
  required_providers {
    docker = {
      source = "OpenRAN/docker"
      version = "~> 2.5.0"
    }
  }
}

provider "docker" {}

resource "docker_image" "cu_OpenRAN" {
  name         = "duOpenRAN:latest"
  keep_locally = false
}

resource "docker_container" "cu_OpenRAN" {
  image = docker_image.cu_OpenRAN.latest
  name  = "cu_cnf"
  ports {
    internal = 90
    external = 9000
  }
}
terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.22.0"
    }
  }
}

provider "docker" {}

resource "docker_image" "simpleGoService" {
  name         = "registry.gitlab.com/alta3/simplegoservice"
  keep_locally = true       // keep image after "destroy"
}

resource "docker_container" "goServiceContainer" {
  image = docker_image.simpleGoService.image_id
  name = var.container_name
  ports {
    internal = var.internal_port
    external = var.external_port
  }
}


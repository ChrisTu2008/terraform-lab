terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "4.6.0"
    }
  }
}

provider "docker" {
  host = "unix:///Users/christu/.docker/run/docker.sock"
}


locals {
  container_name = "${var.project_name}-nginx"
  network_name   = "${var.project_name}-net"
  volume_name    = "${var.project_name}-html"
}

resource "docker_network" "lab" {
  name = local.network_name
}

resource "docker_volume" "html" {
  name = local.volume_name
}

resource "docker_image" "nginx" {
  name         = "nginx:alpine"
  keep_locally = true
}

resource "docker_container" "nginx" {
  name  = local.container_name
  image = docker_image.nginx.image_id

  ports {
    internal = 80
    external = var.host_port
  }

  networks_advanced {
    name = docker_network.lab.name
  }

  volumes {
    volume_name    = docker_volume.html.name
    container_path = "/usr/share/nginx/html"
  }
}

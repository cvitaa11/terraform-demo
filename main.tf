terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
    version = ">= 2.13.0" }
  }
}

provider "docker" {
  # if you use macOS or Linux comment out the following line
  host = "npipe:////.//pipe//docker_engine"
}

resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = false
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.latest
  name  = var.container_name
  ports {
    internal = 80
    external = 8080
  }
}

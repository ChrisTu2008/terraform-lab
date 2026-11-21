terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 4.0"
    }
  }
}

# Provider 只放在根模块，子模块不需要也不应该写
provider "docker" {
  host = "unix:///Users/christu/.docker/run/docker.sock"
}

module "web_a" {
  source         = "./modules/web"
  container_name = "learn-module-a"
  host_port      = 8080
}

module "web_b" {
  source         = "./modules/web"
  container_name = "learn-module-b"
  host_port      = 8081
}

output "url_a" {
  value = module.web_a.url
}

output "url_b" {
  value = module.web_b.url
}

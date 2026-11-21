output "nginx_url" {
  description = "Local URL for the Nginx container"
  value       = "http://localhost:${var.host_port}"
}

output "container_name" {
  description = "Docker container name"
  value       = docker_container.nginx.name
}

output "network_name" {
  description = "Docker network name"
  value       = docker_network.lab.name
}

output "volume_name" {
  description = "Docker volume name"
  value       = docker_volume.html.name
}

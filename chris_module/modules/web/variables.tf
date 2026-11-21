variable "container_name" {
  type = string
}

variable "host_port" {
  type = number
}

variable "image_name" {
  type    = string
  default = "nginx:alpine"
}

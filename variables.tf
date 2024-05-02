variable "digitalocean_api_token" {
  type        = string
  description = "Personal access token used for authenticating to the DigitalOcean API."
}

variable "droplet_image" {
  type        = string
  default     = "fedora-39-x64"
  description = "The image slug or ID used as the base image for a Droplet."
}

variable "droplet_size" {
  type        = string
  default     = "s-1vcpu-2gb"
  description = "The size slug indicating what hardware resources to assign to the Droplet."
}

variable "primary_region" {
  type        = string
  default     = "nyc3"
  description = "The primary region in which to create Droplets."
}

variable "project_name" {
  type        = string
  default     = "Terraform Template"
  description = "A project name used for project and VPC resources."
}

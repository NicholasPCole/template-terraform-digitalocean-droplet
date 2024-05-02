data "digitalocean_ssh_keys" "all" {
  sort {
    key       = "name"
    direction = "asc"
  }
}

data "digitalocean_tag" "base" {
  name = "base"
}

provider "digitalocean" {
  token = var.digitalocean_api_token
}

resource "digitalocean_droplet" "main" {
  image  = var.droplet_image
  name   = "terraform-template-${random_string.random.result}"
  region = var.primary_region
  size   = var.droplet_size

  backups           = false
  droplet_agent     = false
  graceful_shutdown = false
  ipv6              = true
  monitoring        = false
  ssh_keys          = data.digitalocean_ssh_keys.all.ssh_keys.*.id
  tags              = [data.digitalocean_tag.base.name]
  vpc_uuid          = digitalocean_vpc.main.id
}

resource "digitalocean_project" "main" {
  name = var.project_name

  description = var.project_name
  environment = "Development"
  purpose     = "Operational / Developer tooling"
}

resource "digitalocean_project_resources" "main" {
  project = digitalocean_project.main.id
  resources = [
    digitalocean_droplet.main.urn
  ]
}

resource "digitalocean_vpc" "main" {
  name   = lower(replace(var.project_name, " ", "-"))
  region = var.primary_region

  ip_range = "192.168.100.0/24"
}

resource "random_string" "random" {
  length = 8

  lower   = true
  numeric = true
  special = false
  upper   = false
}

terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

terraform {
  required_providers {
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = "~> 1.45"
    }
  }
}

variable "ssh_public_key" {
  type = string
}

variable "repository" {
  description = "Repository for source code"
  type        = string
}

# Locale (module scoped) variables
locals {
  cloud_init = templatefile("${path.module}/cloud-init.yaml", {
    repository = var.repository
  })
}

resource "hcloud_ssh_key" "main" {
  name       = "teacher"
  public_key = var.ssh_public_key
}

resource "hcloud_server" "server" {
  name = "teacher"

  server_type = "cpx21"
  location    = "hel1" # Finland

  image = "debian-12"

  user_data = local.cloud_init

  ssh_keys = [
    hcloud_ssh_key.main.id
  ]
}

output "app_info" {
  value = {
    ipv4_address = hcloud_server.server.ipv4_address
    user_data    = local.cloud_init
  }
}

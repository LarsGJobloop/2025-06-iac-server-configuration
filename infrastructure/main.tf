terraform {
  required_providers {
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = "~> 1.45"
    }
  }
}

provider "hcloud" {
  token = var.hcloud_token
}

variable "hcloud_token" {
  sensitive = true
}


output "server_info" {
  value = {
    ipv4_address = hcloud_server.server.ipv4_address
  }
}

variable "ssh_public_key" {
  type = string
}

resource "hcloud_ssh_key" "main" {
  name       = "teacher"
  public_key = var.ssh_public_key
}

resource "hcloud_server" "server" {
  name        = "teacher"

  server_type = "cx22"
  location = "hel1" # Finland

  image       = "debian-12"

  ssh_keys = [
    hcloud_ssh_key.main.id
  ]
}

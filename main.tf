terraform {
  required_providers {
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = "~> 1.45"
    }
  }
}

variable "hcloud_token" {
  sensitive = true
}

provider "hcloud" {
  token = var.hcloud_token
}

resource "hcloud_ssh_key" "main" {
  name       = "teacher"
  public_key = file("./ed_id.pub")
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

output "server_info" {
  value = {
    ipv4_address = hcloud_server.server.ipv4_address
  }
}

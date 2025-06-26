# Provider configuration
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


# Input variables (arguments)
variable "hcloud_token" {
  sensitive = true
}

variable "ssh_public_key" {
  type = string
}


# Configuration
module "dotnet_app" {
  source = "./dotnet-app"

  repository = "https://github.com/LarsGJobloop/2025-06-iac-server-configuration.git"

  # For debugging
  ssh_public_key = var.ssh_public_key
}


# Output variables (return values)
output "app" {
  value = module.dotnet_app.app_info
}

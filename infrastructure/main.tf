module "dotnet_app" {
  source = "./dotnet-app"

  repository = "https://github.com/LarsGJobloop/2025-06-iac-server-configuration.git"

  # For debugging
  ssh_public_key = var.ssh_public_key
}

# All input variables (arguments)
variable "hcloud_token" {
  sensitive = true
}

variable "ssh_public_key" {
  type = string
}

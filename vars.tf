#variable "zone_id" {
#  type = "string"
#  default = "ZUYOKXBWM9MWO"
#}

variable "domains" {
  type    = "list"
  default = ["web", "api"]
}

variable "name" {
  default = "calc"
}

variable "environment" {
  default = "prod"
}
variable "ssh_key_path" {
  default = "~/.aws/id_rsa.pub"
}

#variable "allowed_mgmnt_address" {
#  description = "Allowed address for ssh connect"
#  type = "list"
#  default = ["46.219.216.0/24", "217.20.191.18/32"]
#}

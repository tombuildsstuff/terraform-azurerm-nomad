variable "location" {}

variable "prefix" {}

variable "resource_group_name" {}

variable "tags" {
  default = {}
  type    = "map"
}

variable "subnet_id" {}

variable "vm_size" {}

variable "username" {}

variable "image_id" {}

variable "public_ssh_key" {}

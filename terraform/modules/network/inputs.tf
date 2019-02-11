variable "location" {}

variable "prefix" {}

variable "resource_group_name" {}

variable "tags" {
  default = {}
  type    = "map"
}

locals {
  prefix   = "tomdev99"
  username = "tharvey"
  ssh_key  = "${file("~/.ssh/id_rsa.pub")}"

  tags = {
    "HashiStack" = "OsloDev"
  }
}

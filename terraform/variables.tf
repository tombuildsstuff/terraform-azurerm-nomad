locals {
  prefix   = "oslolive"
  username = "tharvey"
  ssh_key  = "${file("~/.ssh/id_rsa.pub")}"

  tags = {
    "OsloHUG" = "2019-02-11"
  }
}

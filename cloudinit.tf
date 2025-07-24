locals {
  hostname   = "coder"
  linux_user = "coder"
}

data "cloudinit_config" "user_data" {
  gzip          = false
  base64_encode = false

  boundary = "//"

  part {
    filename     = "cloud-config.yaml"
    content_type = "text/cloud-config"

    content = templatefile("${path.module}/cloud-init/cloud-config.yaml.tftpl", {
      hostname   = local.hostname
      linux_user = local.linux_user
    })
  }
}

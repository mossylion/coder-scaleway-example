
resource "scaleway_instance_server" "web" {
  name       = "${var.hostname}-server"
  type       = var.instance_size
  image      = var.image
  ip_ids     = compact([scaleway_instance_ip.server_ip.id, scaleway_instance_ip.v4_server_ip.id])
  project_id = data.scaleway_account_project.main.project_id
  tags       = var.tags
  
  user_data = {
    cloud-init = data.cloudinit_config.user_data.rendered
  }
  
  root_volume {
    size_in_gb  = var.volume_size
    volume_type = "l_ssd"
  }

  security_group_id = scaleway_instance_security_group.coder.id
}

resource "scaleway_instance_security_group" "coder" {
  name        = "${var.hostname}-security-group"
  description = "Security group for Coder server"
  project_id  = data.scaleway_account_project.main.project_id
  tags        = var.tags

  inbound_default_policy  = "drop"
  outbound_default_policy = "accept"

  inbound_rule {
    action   = "accept"
    protocol = "TCP"
    port     = 22
  }
}

resource "scaleway_instance_ip" "server_ip" {
  type       = "routed_ipv6"
  project_id = data.scaleway_account_project.main.project_id
  tags       = var.tags
}

resource "scaleway_instance_ip" "v4_server_ip" {
  type       = "routed_ipv4"  
  project_id = data.scaleway_account_project.main.project_id
  tags       = var.tags
}


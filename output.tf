output "instance_ipv4" {
  description = "Public IPv4 address of the instance"
  value       = scaleway_instance_ip.v4_server_ip.address
}

output "instance_ipv6" {
  description = "Public IPv6 address of the instance"
  value       = scaleway_instance_ip.server_ip.address
}

output "coder_url" {
  description = "URL to access Coder server"
  value       = "http://${scaleway_instance_ip.v4_server_ip.address}"
}

output "coder_setup_instructions" {
  description = "Instructions to get the Try Coder URL"
  value       = "SSH to ${scaleway_instance_ip.v4_server_ip.address} and run: sudo journalctl -u coder -f | grep -E 'try.*coder|tunnel.*url'"
}

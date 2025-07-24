variable "instance_size" {
  default = "STARDUST1-S"
}

variable "image" {
  default = "debian_bookworm"
}

variable "volume_size" {
  default = 10
}

variable "project_name" {
  default = "default"
  type    = string
}

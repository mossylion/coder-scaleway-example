variable "instance_size" {
  description = "The size of the Scaleway instance"
  type        = string
  default     = "STARDUST1-S"
  validation {
    condition = contains([
      "STARDUST1-S", "DEV1-S", "DEV1-M", "DEV1-L", 
      "GP1-XS", "GP1-S", "GP1-M", "GP1-L"
    ], var.instance_size)
    error_message = "Instance size must be a valid Scaleway instance type."
  }
}

variable "image" {
  description = "The base image for the instance"
  type        = string
  default     = "debian_bookworm"
  validation {
    condition     = can(regex("^[a-zA-Z0-9_-]+$", var.image))
    error_message = "Image name must contain only alphanumeric characters, hyphens, and underscores."
  }
}

variable "volume_size" {
  description = "Size of the root volume in GB"
  type        = number
  default     = 10
  validation {
    condition     = var.volume_size >= 10 && var.volume_size <= 1000
    error_message = "Volume size must be between 10 and 1000 GB."
  }
}

variable "project_name" {
  description = "The name of the Scaleway project"
  type        = string
  default     = "default"
  validation {
    condition     = length(var.project_name) > 0
    error_message = "Project name cannot be empty."
  }
}

variable "region" {
  description = "The Scaleway region"
  type        = string
  default     = "fr-par"
  validation {
    condition = contains([
      "fr-par", "nl-ams", "pl-waw"
    ], var.region)
    error_message = "Region must be a valid Scaleway region."
  }
}

variable "zone" {
  description = "The Scaleway availability zone"
  type        = string
  default     = "fr-par-1"
  validation {
    condition = contains([
      "fr-par-1", "fr-par-2", "fr-par-3",
      "nl-ams-1", "nl-ams-2", "nl-ams-3",
      "pl-waw-1", "pl-waw-2", "pl-waw-3"
    ], var.zone)
    error_message = "Zone must be a valid Scaleway availability zone."
  }
}

variable "hostname" {
  description = "Hostname for the server"
  type        = string
  default     = "coder"
  validation {
    condition     = can(regex("^[a-zA-Z0-9-]+$", var.hostname))
    error_message = "Hostname must contain only alphanumeric characters and hyphens."
  }
}

variable "linux_user" {
  description = "Linux user for the server"
  type        = string
  default     = "coder"
  validation {
    condition     = can(regex("^[a-z][a-z0-9-]*$", var.linux_user))
    error_message = "Linux user must start with a lowercase letter and contain only lowercase letters, numbers, and hyphens."
  }
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = list(string)
  default     = ["terraform", "coder"]
}

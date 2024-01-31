variable "az_location" {
  type        = string
  description = "Azure region location"
  default     = "West Europe"
}

variable "environment" {
  description = "Environment variable"
  type        = string
  default     = "dev"
}

variable "private_subnet" {
  description = "Map of subnet names and CIDRs"
  type        = map(string)
  default = {
    "private-1-west-europe" = "10.14.1.0/24",
    "private-2-west-europe" = "10.14.2.0/24",
    "private-3-west-europe" = "10.14.3.0/24",
  }
}

variable "k8s_version" {
  description = "Kubernetes version"
  type        = string
  default     = "1.27.7"
}

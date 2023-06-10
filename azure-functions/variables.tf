variable "project" {
  type = string
  description = "Project name"
  default = "azuretest"
}

variable "environment" {
  type = string
  description = "Environment (dev / stage / prod)"
  default = "dev"
}

variable "location" {
  type = string
  description = "Azure region to deploy module to"
  default = "polandcentral"
}
variable "project" {
  type = string
  description = "Project name"
}

variable "environment" {
  type = string
  description = "Environment (dev / stage / prod)"
}

variable "location" {
  type = string
  description = "Azure region to deploy module to"
}

variable "blob_name" {
  type = string
  description = "Final name for blob storage"
}

variable "blob_source" {
  type = string
  description = "Blob storage source file"
}
//rg-dev-tfdemo-aae
variable "rg-prefix" {
    type = string
    description = "Prefix for rg"
}
variable "project-name" {
    type = string
    description = "Name of the project."
}
variable "env-prefix" {
  type = string
  description = "Prefix for env"
}
variable "location-prefix" {
    type = string
    description = "Location prefix for all resources."
}
variable "location" {
    type = string
    description = "location for all resources."
}
variable "environment" {
    type = string
    description = "Environment name."
    default = "Development"
}
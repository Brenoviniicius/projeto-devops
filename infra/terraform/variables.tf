variable "subscription_id" {
  type = string
}

variable "tenant_id" {
  type = string
}

variable "location" {
  type    = string
  default = "brazilsouth"
}

variable "environment" {
  type    = string
  default = "dev"
}

variable "resource_group" {
  type    = string
  default = "rg-devops-pratica"
}

variable "acr_name" {
  type = string
}

variable "aks_name" {
  type = string
}

variable "dns_prefix" {
  type    = string
  default = "devopspratica"
}

variable "node_count" {
  type    = number
  default = 2
}

variable "vm_size" {
  type    = string
  default = "Standard_DS2_v2"
}
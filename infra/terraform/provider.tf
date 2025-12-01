terraform {
  required_version = "=> 1.6.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=> 3.1"
    }
  }
}

provider "azurerm" {
  features {}
}

locals {
  tags = {
    project  = "pratica-devops"
    owner    = "Breno"
    workload = "aks"
    env      = var.environment
  }
}
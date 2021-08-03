terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
    datadog = {
      source = "DataDog/datadog"
    }
  }
}

variable "do_token" {
  description = "DO Access Token"
  type        = string
}

variable "datadog_api_key" {
  type        = string
  sensitive   = true
}

variable "datadog_app_key" {
  type        = string
  sensitive   = true
}

provider "datadog" {
  api_key = var.datadog_api_key
  app_key = var.datadog_app_key
}

provider "digitalocean" {
  token = var.do_token
}

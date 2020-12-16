terraform {
  required_providers {
    docker = {
      source = "terraform-providers/docker"
    }
    local = {
      source = "hashicorp/local"
    }
  }
  required_version = ">= 0.13"
}

provider "docker" {
  host = "ssh://ubuntu@192.168.1.6:22"
}

provider "local" {
  version = "~> 1.4.0"
}
terraform {
  required_providers {
    docker = {
      source = "terraform-providers/docker"
    }
    influxdbv2 = {
      source = "lancey.fr/influx/influxdbv2"
    }
    influxdbv2-onboarding = {
      source = "lancey.fr/influx/influxdbv2-onboarding"
    }
    local = {
      source = "hashicorp/local"
    }
  }
  required_version = ">= 0.14"
  backend "local" {}
}

provider "docker" {
  host = "ssh://fred@192.168.1.3:22"
}

provider "influxdbv2" {
  #version = "0.3.0"
  url     = local.influx_url
  token   = influxdbv2-onboarding_setup.setup.token
}

provider "influxdbv2-onboarding" {
  #version  = "0.2.0"
  url      = local.influx_url
}

provider "local" {
  #version = "~> 1.4.0"
}
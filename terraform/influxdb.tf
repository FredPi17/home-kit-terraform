resource "docker_container" "influx" {
  image = docker_image.influx.latest
  name  = "influx"
  restart = "always"
  mounts {
      source = "/home/fred/iot/influxdb"
      type = "bind"
      target = "/var/lib/influxdb"
  }
  ports {
      internal = 8086
      external = 8086
  }

}

resource "docker_image" "influx" {
  name = "quay.io/influxdb/influxdb:v2.0.2"
}

resource "influxdbv2-onboarding_setup" "setup" {
    depends_on = [
        docker_container.influx
    ]
    username = "fred"
    password = var.influx_admin_password
    org = "home-kit"
    bucket = "default"
}

resource "influxdbv2_bucket" "network" {
    depends_on =  [influxdbv2-onboarding_setup.setup]
    name = "network"
    org_id = influxdbv2-onboarding_setup.setup.org_id
}

resource "influxdbv2_authorization" "network" {
    depends_on = [influxdbv2-onboarding_setup.setup]
    org_id = influxdbv2-onboarding_setup.setup.org_id
    description = "network"
    status = "active"
    permissions {
        action = "read"
        resource {
            type = "buckets"
            id = influxdbv2_bucket.network.id
            org_id = influxdbv2-onboarding_setup.setup.org_id
        }
    }
    permissions {
        action = "write"
        resource {
            type = "buckets"
            id = influxdbv2_bucket.network.id
            org_id = influxdbv2-onboarding_setup.setup.org_id
        }
    }

}
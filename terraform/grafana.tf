resource "docker_container" "grafana" {
  image = docker_image.grafana.latest
  name  = "grafana"
  ports {
      internal = 3000
      external = 3000
  }
  mounts {
      source = "/home/fred/iot/grafana"
      type = "bind"
      target = "/var/lib/grafana"
  }

  mounts {
      source = "/home/fred/iot/grafana/log"
      type = "bind"
      target = "/var/log/grafana"
  }
}

resource "docker_image" "grafana" {
  name = "grafana/grafana:latest"
}
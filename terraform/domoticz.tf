resource "docker_container" "domoticz" {
  image = docker_image.domoticz.latest
  name  = "domoticz"
  restart = "unless-stopped"
  mounts {
      source = "/home/fred/iot/domoticz"
      type = "bind"
      target = "/config"
  }
  ports {
      internal = 8080
      external = 8080
  }
  ports {
      internal = 1443
      external = 1443
  }
  ports {
      internal = 6144
      external = 6144
  }
  env = ["PUID=1000","PGID=1000","TZ=Europ/Paris"]
}

resource "docker_image" "domoticz" {
  name = "linuxserver/domoticz:latest"
}
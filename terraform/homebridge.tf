resource "docker_container" "homebridge" {
  image = docker_image.homebridge.latest
  name  = "homebridge"
  restart = "unless-stopped"
  env = ["PUID=1000","PGID=1000","TZ=Europ/Paris","HOMEBRIDGE_CONFIG_UI=1","HOMEBRIDGE_CONFIG_UI_PORT=8090","HOMEBRIDGE_INSECURE=1"]
  mounts {
      source = "/home/fred/iot/homebridge"
      type = "bind"
      target = "/homebridge"
  }

}

resource "docker_image" "homebridge" {
  name = "oznu/homebridge:latest"
}
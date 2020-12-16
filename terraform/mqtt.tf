resource "docker_container" "mqtt" {
  image = docker_image.mqtt.latest
  name  = "mqtt"
  restart = "unless-stopped"
  ports {
      internal = 1883
      external = 1883
  }
}

resource "docker_image" "mqtt" {
  name = "eclipse-mosquitto"
}
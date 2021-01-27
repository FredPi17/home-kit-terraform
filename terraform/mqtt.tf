resource "docker_container" "mqtt" {
  image = docker_image.mqtt.latest
  name  = "mqtt"
  restart = "unless-stopped"
  ports {
      internal = 1883
      external = 1883
  }
  env = ["DOCKER_VERNEMQ_ACCEPT_EULA=yes","DOCKER_VERNEMQ_ALLOW_ANONYMOUS=on"]
}

resource "docker_image" "mqtt" {
  name = "vernemq/vernemq"
}
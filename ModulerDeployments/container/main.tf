resource "docker_container" "nodered_container" {
  name  = var.name_in
  image = var.image_in
  ports {
    internal = var.int_port_in
    external = var.ext_port_in
  }
  volumes {
    container_path = var.container_path_in
    volume_name = docker_volume.container_volume.name
  }
}

resource "docker_volume" "container_volume" {
#   This creates a cyclic dependency which can be seen with below graph command
#   <code>terraform graph -draw-cycles| dot -Tpdf > graph-cycle.pdf</code>
#  name = "${docker_container.nodered_container.name}-volume"
  name = "${var.name_in}-volume"
  lifecycle {
    prevent_destroy = false
  }
}
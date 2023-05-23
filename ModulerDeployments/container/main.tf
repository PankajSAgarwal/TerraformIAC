resource "random_string" "random" {
  count = var.count_in
  length = 4
  special = false
  upper = false
}
resource "docker_container" "nodered_container" {
  count = var.count_in
  name  = join("-",[var.name_in,terraform.workspace,random_string.random[count.index].result])
  image = var.image_in
  ports {
    internal = var.int_port_in
    external = var.ext_port_in[count.index]
  }
  volumes {
    container_path = var.container_path_in
    volume_name = docker_volume.container_volume[count.index].name
  }
}

resource "docker_volume" "container_volume" {
  count = var.count_in
#   This creates a cyclic dependency which can be seen with below graph command
#   <code>terraform graph -draw-cycles| dot -Tpdf > graph-cycle.pdf</code>
#  name = "${docker_container.nodered_container.name}-volume"
  name = "${var.name_in}-${random_string.random[count.index].result}-volume"
  lifecycle {
    prevent_destroy = false
  }
}
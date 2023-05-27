#output "container_name" {
#  value = module.container[*].container_name
#  description = "The name of the container"
#}
#
#output "ip-address" {
#  value = flatten(module.container[*].ip-address)
#  description = "The ip address and external port of the container"
#}

output "application_access" {
  value       = module.container
  description = "The name and socket of each application"
}
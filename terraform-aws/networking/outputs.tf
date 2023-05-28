# -------- networking/outputs.tf--------------
output "vpc_id" {
  value = aws_vpc.pankaj_vpc.id
}
output "db_subnet_group_name" {
  value = aws_db_subnet_group.pankaj_rds_subnetgroup.*.name
}
output "db_security_group" {
  value = [aws_security_group.pankaj_sg["rds"].id]
}
output "public_sg" {
  value = aws_security_group.pankaj_sg["public"].id
}
output "public_subnets" {
  value = aws_subnet.pankaj_public_subnet.*.id
}

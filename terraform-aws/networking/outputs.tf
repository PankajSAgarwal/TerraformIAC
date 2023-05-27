# -------- networking/outputs.tf--------------
output "vpc_id" {
  value = aws_vpc.pankaj_vpc.id
}
output "public_sg_id" {
  value = aws_security_group.vpc_public_security_group.id
}

output "private_sg_id" {
  value = aws_security_group.vpc_private_security_group.id
}


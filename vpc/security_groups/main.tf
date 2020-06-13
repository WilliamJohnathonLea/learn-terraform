# Create a security group for public facing HTTPS services
resource "aws_security_group" "vpc_public_security_group" {
  name        = "public_https"
  description = "Allow public HTTPS inbound traffic"
  vpc_id      = var.vpc_id

  ingress {
    description = "Inbound HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    # HTTPS from everywhere
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Inbound HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    # HTTP from everywhere
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Inbound HTTP"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    # HTTP from everywhere
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Inbound SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Create a security group for internal HTTPS services
resource "aws_security_group" "vpc_private_security_group" {
  name        = "private_https"
  description = "Allow private HTTPS inbound traffic"
  vpc_id      = var.vpc_id

  ingress {
    description = "Inbound HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    # HTTPS from the VPC
    cidr_blocks = ["10.0.0.0/16"]
  }

  ingress {
    description = "Inbound SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

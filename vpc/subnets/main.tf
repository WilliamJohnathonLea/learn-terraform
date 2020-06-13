# Create a subnet to launch our instances into
resource "aws_subnet" "vpc_subnet_1" {
  vpc_id                  = var.vpc_id
  availability_zone       = "eu-west-2a"
  cidr_block              = "10.0.0.0/20"
  map_public_ip_on_launch = false
  tags = {
    Name = "${var.name_tag}-sn-1"
    Env  = "${var.env_tag}"
  }
}

# Create a subnet to launch our instances into
resource "aws_subnet" "vpc_subnet_2" {
  vpc_id                  = var.vpc_id
  availability_zone       = "eu-west-2b"
  cidr_block              = "10.0.16.0/20"
  map_public_ip_on_launch = false
  tags = {
    Name = "${var.name_tag}-sn-2"
    Env  = "${var.env_tag}"
  }
}

# Create a subnet to launch our instances into
resource "aws_subnet" "vpc_subnet_3" {
  vpc_id                  = var.vpc_id
  availability_zone       = "eu-west-2c"
  cidr_block              = "10.0.32.0/20"
  map_public_ip_on_launch = false
  tags = {
    Name = "${var.name_tag}-sn-3"
    Env  = "${var.env_tag}"
  }
}

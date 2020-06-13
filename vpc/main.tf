# Create the VPC
resource "aws_vpc" "vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "${var.vpc_name}"
    Env  = "${var.env_tag}"
  }
}

# Create an internet gateway so the subnet can talk
# to the internet
resource "aws_internet_gateway" "vpc_ig" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "${var.vpc_name}-ig"
    Env  = "${var.env_tag}"
  }
}

# Grant the VPC internet access on its main route table
resource "aws_route" "vpc_internet_access" {
  route_table_id         = aws_vpc.vpc.main_route_table_id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.vpc_ig.id
}

# Create the three subnets to sit in each availability zone
module "vpc_subnets" {
  source   = "./subnets"
  vpc_id   = aws_vpc.vpc.id
  name_tag = var.vpc_name
  env_tag  = var.env_tag
}

module "vpc_security_groups" {
  source = "./security_groups"
  vpc_id = aws_vpc.vpc.id
}

module "vpc_key_pairs" {
  source = "./key_pairs"
}

module "vpc_jenkins" {
  source = "./jenkins"
  key_name = module.vpc_key_pairs.kp_name
  subnet_id = module.vpc_subnets.subnet_1_id
  sg_id = module.vpc_security_groups.public_sg_id
}

module "vpc_instances" {
  source        = "./instances"
  key_name      = module.vpc_key_pairs.kp_name
  subnet_1_id   = module.vpc_subnets.subnet_1_id
  subnet_2_id   = module.vpc_subnets.subnet_2_id
  subnet_3_id   = module.vpc_subnets.subnet_3_id
  public_sg_id  = module.vpc_security_groups.public_sg_id
  private_sg_id = module.vpc_security_groups.private_sg_id
}

provider "aws" {
  region = "eu-west-2"
}

module "dev_vpc" {
  source   = "./vpc"
  vpc_name = "vpc-dev"
  env_tag  = "DEV"
}

# module "qa_vpc" {
#   source   = "./vpc"
#   vpc_name = "vpc-qa"
#   env_tag  = "QA"
# }

# module "staging_vpc" {
#   source   = "./vpc"
#   vpc_name = "vpc-staging"
#   env_tag  = "STAGING"
# }

# module "prod_vpc" {
#   source   = "./vpc"
#   vpc_name = "vpc-prod"
#   env_tag  = "PROD"
# }

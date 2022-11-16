# configue aws provider 
provider "aws" {
  region = var.region
  profile = "sanjay.baskar"
}

# create vpc

module "vpc_module" {
    source = "../modules/vpc"
    region = var.region
    project_name = var.project_name
    vpc_cidr = var.vpc_cidr
    public_subnet_az1_cidr = var.public_subnet_az1_cidr
    public_subnet_az2_cidr = var.public_subnet_az2_cidr
    private_app_subnet_az1_cidr = var.private_app_subnet_az1_cidr
    private_app_subnet_az2_cidr = var.private_app_subnet_az2_cidr
    private_data_subnet_az1_cidr = var.private_data_subnet_az1_cidr
    private_data_subnet_az2_cidr = var.private_data_subnet_az2_cidr

}

# create nat gateways 

module "nat_module" {

  source = "../modules/nat-gateway"
  public_subnet_az1_id = module.vpc_module.public_subnet_az1_id
  internet_gateway = module.vpc_module.internet_gateway
  public_subnet_az2_id = module.vpc_module.public_subnet_az2_id
  vpc_id = module.vpc_module.vpc_id
  private_app_subnet_az1_id = module.vpc_module.private_app_subnet_az1_id
  private_data_subnet_az1_id = module.vpc_module.private_data_subnet_az1_id
  private_app_subnet_az2_id = module.vpc_module.private_app_subnet_az2_id
  private_data_subnet_az2_id = module.vpc_module.private_data_subnet_az2_id
  
}

# create security groups

module "security_group" {
  source = "../modules/security-groups"
  vpc_id = module.vpc_module.vpc_id
}


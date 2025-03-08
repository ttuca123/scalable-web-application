provider "aws" {
  region = "us-east-1"
  access_key = var.access_key
  secret_key = var.secret_key
}

/*module "roles" {
  source = "./modules/roles"
}*/

module "loadbalance" {
  source = "./modules/loadbalance"
  vpc_id = "vpc-07028d6b0b4f6c6a7"
  subnets = ["subnet-01ca57a2fcdc83824", "subnet-02c9d8caa4f7845d7"]
}

module "launchtemplate" {
  source = "./modules/launchtemplate"
  
}
module "asg" {
  source = "./modules/asg"
  launch_template_id = module.launchtemplate.launch_template_id
  launch_template_version = module.launchtemplate.launch_template_version
  subnets = ["subnet-01ca57a2fcdc83824", "subnet-02c9d8caa4f7845d7"]
  target_group_arn = module.loadbalance.target_group_arn
}

module "iam_roles" {
  source = "./modules/iam"
  dba_policy_arn = var.dba_policy_arn
  infra_operator_policy_arn = var.infra_operator_policy_arn
}

module "cloudfront" {
  source = "./modules/cloudfront"
}
module "rds" {
  source                = "./modules/rds"
  db_kms_encryption_arn = var.db_kms_encryption_arn
  db_subnet_group_name  = var.db_subnet_group_name
  access_key = var.access_key
  secret_key = var.secret_key
}
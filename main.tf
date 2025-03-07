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
}

module "iam_roles" {
  source = "./modules/iam"
  dba_policy_arn = var.dba_policy_arn
  infra_operator_policy_arn = var.infra_operator_policy_arn


module "cloudfront" {
  source = "./modules/cloudfront"

module "rds" {
  source                = "./modules/rds"
  db_kms_encryption_arn = var.db_kms_encryption_arn
  db_subnet_group_name  = var.db_subnet_group_name
  access_key = var.access_key
  secret_key = var.secret_key
}
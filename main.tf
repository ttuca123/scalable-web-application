provider "aws" {
    region = "us-east-1"
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
}
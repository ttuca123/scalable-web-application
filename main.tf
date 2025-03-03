provider "aws" {
    region = "us-east-1"
}

/*module "roles" {
  source = "./modules/roles"
}*/

module "loadbalance" {
  source = "./modules/loadbalance"
}
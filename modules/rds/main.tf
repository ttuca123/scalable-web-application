provider "aws" {
    region = "us-east-1"
    access_key = var.access_key
    secret_key = var.secret_key
}

data "aws_db_subnet_group" "db_subnet_group_name" {
  name = var.db_subnet_group_name
}

resource "aws_db_instance" "default" {
  allocated_storage    = 100
  max_allocated_storage = 1000
  db_name              = "db-arquitetura"
  engine               = "postgres"
  engine_version       = "17.4.r1"
  multi_az             = true
  instance_class       = "db.m5.2xlarge"
  username             = "lab_arquitetura"
  password             = "senhamuitosegura" 
  parameter_group_name = "default.mysql8.0"
  kms_key_id = var.db_kms_encryption_arn
  db_subnet_group_name = var.db_subnet_group_name
  performance_insights_enabled = true
  skip_final_snapshot  = false
  monitoring_interval = 60
  backup_retention_period = 7
  auto_minor_version_upgrade  = true
}
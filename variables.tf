variable "db_kms_encryption_arn" {
  type        = string
  description = "Chave KMS de encriptação dos dados"
}

variable "db_subnet_group_name" {
  type        = string
  description = "Nome do Subnet Group da instância RDS"
}

variable "access_key" {
  type = string
  description = "AWS Access Key"
}

variable "secret_key" {
  type = string
  description = "AWS Secret Key"
}
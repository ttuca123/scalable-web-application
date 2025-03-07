# Políticas criadas para fins didáticos de separação de privilégio entre usuários.
# Essas políticas devem ser criadas na conta em que o projeto Terraform for executado.
# Definições das política em "prints".

variable "dba_policy_arn" {
  type = string
  description = "ARN da policy de DBA"
}

variable "infra_operator_policy_arn" {
  type = string
  description = "ARN da policy de Infra Operator"
}

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

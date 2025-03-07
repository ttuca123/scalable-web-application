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


variable "launch_template_id" {
  type = string
  description = "ID do Launch Template"
}

variable "launch_template_version" {
  type = string
  description = "Versão do Launch Template"
  
}

variable "subnets" {
  type = list(string)
  description = "Lista de subnets"
  
}

variable "target_group_arn" {
  type = string
  description = "ARN do target group"
  
}
variable "subnets" {
  type = list(string)
  description = "Lista de subnets"
}

variable "vpc_id" {
  type = string
  description = "ID da VPC"
}
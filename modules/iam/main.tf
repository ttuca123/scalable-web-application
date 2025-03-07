provider "aws" {
  region = "us-east-1"
}

data "aws_iam_policy" "dba_policy" {
  arn = var.dba_policy_arn
}

resource "aws_iam_role" "dba_role" {
  name = "DBA_Role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action    = "sts:AssumeRole"
        Effect    = "Allow"
        Principal = {
          AWS = [
            "arn:aws:iam::123456789012:user/DBA_User" # Usuário e conta hipotéticos
          ]
        }
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "dba_role_attachment" {
  role = aws_iam_role.dba_role.name
  policy_arn = data.aws_iam_policy.dba_policy.arn
}


data "aws_iam_policy" "infra_operator_policy" {
  arn = var.infra_operator_policy_arn
}

resource "aws_iam_role" "infra_operator_role" {
  name = "Infra_Operator_Role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action    = "sts:AssumeRole"
        Effect    = "Allow"
        Principal = {
          AWS = [
            "arn:aws:iam::123456789012:user/Infra_Operator_User" # Usuário e conta hipotéticos
          ]
        }
      }
    ]
  })
}


resource "aws_iam_role_policy_attachment" "infra_operator_attachment" {
  role = aws_iam_role.infra_operator_role.name
  policy_arn = data.aws_iam_policy.infra_operator_policy
}
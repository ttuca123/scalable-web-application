
# Criando a Role IAM
resource "aws_iam_role" "roleJob" {
  name               = "role-job"  # Nome da role
  assume_role_policy = data.aws_iam_policy_document.trust_policy.json  # Política de confiança
}

# Criando a Política de Confiança (Trust Policy)
data "aws_iam_policy_document" "trust_policy" {
  statement {
    actions   = ["sts:AssumeRole"]  # Permissões necessárias para a role assumir
    effect    = "Allow"
    principals {
      type        = "Service"  # Tipo de principal: o serviço
      identifiers = ["ec2.amazonaws.com"]  # O EC2 pode assumir esta role
    }
  }
}

# Criando a Política de Permissões
resource "aws_iam_policy" "policy_job" {
  name        = "policy_job"
  description = "Uma política que permite vários acessos"
  policy      = data.aws_iam_policy_document.permissions_policy.json  # Política de permissões
}

# Criando a Política de Permissões (Permissões para acessar o S3)
data "aws_iam_policy_document" "permissions_policy" {
  statement {
    actions   = ["s3:*"]  # Permissões totais no S3
    effect    = "Allow"
    resources = ["arn:aws:s3:::my-bucket", "arn:aws:s3:::my-bucket/*"]  # Recursos do S3
  }
}

# Criando a Política de Permissões para Load Balancer
resource "aws_iam_policy" "alb_policy" {
  name        = "my-alb-policy"
  description = "A policy that allows interaction with Application Load Balancers"
  policy      = data.aws_iam_policy_document.permissions_alb_policy.json  # Política de permissões para ALB
}

# Criando a Política de Permissões (Permissões para interagir com ALB)
data "aws_iam_policy_document" "permissions_alb_policy" {
  statement {
    actions   = [
      "elasticloadbalancing:DescribeLoadBalancers",
      "elasticloadbalancing:DescribeTargetGroups",
      "elasticloadbalancing:DescribeTargets",
      "elasticloadbalancing:RegisterTargets",
      "elasticloadbalancing:DeregisterTargets"
    ]
    effect    = "Allow"
    resources = ["*"]  # Ação permitida para todos os recursos de ALB
  }
}

# Associando a Política à Role
resource "aws_iam_role_policy_attachment" "role_policy_attachment" {
  policy_arn = aws_iam_policy.policy_job.arn  # Política que criamos
  role       = aws_iam_role.roleJob.name    # Role que criamos
}

# Associando a Política de Permissões ALB à Role
resource "aws_iam_role_policy_attachment" "role_policy_attachment_alb" {
  policy_arn = aws_iam_policy.alb_policy.arn  # Política de ALB que criamos
  role       = aws_iam_role.roleJob.name     # Correção aqui: Agora está referenciando roleJob
}

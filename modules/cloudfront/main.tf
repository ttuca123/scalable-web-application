provider "aws" {
    region = "us-east-1"
}

# Definindo o bucket S3
resource "aws_s3_bucket" "trabalhobucket" {
  bucket = "trabalho-bucket-terraform-unique" # Substitua com um nome único para o seu bucket  
}

# Definindo a distribuição do CloudFront
resource "aws_cloudfront_distribution" "trabalhodistribuicao" {
  origin {
    domain_name = aws_s3_bucket.trabalhobucket.bucket_regional_domain_name
    origin_id   = "S3-trabalhobucket-origin"

    s3_origin_config {
      origin_access_identity = "" # Se necessário, adicione a identidade de acesso
    }
  }

  enabled             = true
  is_ipv6_enabled     = true
  comment             = "Distribuição CloudFront para o meu S3"
  default_root_object = "index.html" # Ajuste conforme necessário

  default_cache_behavior {
    target_origin_id = "S3-trabalhobucket-origin"
    viewer_protocol_policy = "redirect-to-https"

    allowed_methods = ["GET", "HEAD"]    

    cached_methods = ["GET", "HEAD"]    

    forwarded_values {
      query_string = false
      cookies {
        forward = "none"
      }
    }

    min_ttl     = 0
    default_ttl = 3600
    max_ttl     = 86400
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }

 

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }
}

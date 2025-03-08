# resource "aws_launch_template" "asg" {
#   name_prefix   = "asg-template"
#   image_id      = "ami-00a58472648f8ab89"  # Substitua com o ID da AMI que deseja usar
#   instance_type = "t2.micro"
# }

resource "aws_autoscaling_group" "asg" {
    name = "asg"
    min_size = 2
    max_size = 3
    desired_capacity = 2
    target_group_arns = [var.target_group_arn]
    launch_template {
        id = var.launch_template_id
        version = var.launch_template_version
    }
    
    vpc_zone_identifier = var.subnets
}


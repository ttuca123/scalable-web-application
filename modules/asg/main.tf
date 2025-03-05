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
    
    launch_template {
        id = "lt-0a2362ab88b3da744"
        version = "1"
    }
    
    vpc_zone_identifier = ["subnet-098de0520055aa805", "subnet-0f2a6ba9d7567f527"]
}


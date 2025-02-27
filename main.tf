provider "aws" {
    region = "us-east-1"
}

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
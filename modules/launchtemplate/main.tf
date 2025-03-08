resource "aws_launch_template" "lt-amazon-linux" {
  name_prefix   = "lt-amazon-linux"
  image_id      = "ami-08b5b3a93ed654d19"  # Substitua com o ID da AMI que deseja usar
  instance_type = "t2.micro"
}
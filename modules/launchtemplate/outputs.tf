output "launch_template_id" {
    value = aws_launch_template.lt-amazon-linux.id
}

output "launch_template_version" {
    value = aws_launch_template.lt-amazon-linux.latest_version
}
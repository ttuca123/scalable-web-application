module "autoscaling_group" {
  source = "../asg"
  
}

resource "aws_cloudwatch_metric_alarm" "instances-cpu-utilization" {
    alarm_name          = "instances-cpu-utilization"
    comparison_operator = "GreaterThanOrEqualToThreshold"
    evaluation_periods  = 2
    metric_name         = "CPUUtilization"
    namespace           = "AWS/EC2"
    period              = 120
    statistic           = "Average"
    threshold           = 80

    dimensions = {
        AutoScalingGroupName = module.autoscaling_group.autoscaling_group_name
    }

    alarm_description = "This metric monitors ec2 cpu utilization"
}

resource "aws_cloudwatch_metric_alarm" "instances-network-in" {
  alarm_name          = "instances-network-in"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 2
  metric_name         = "NetworkIn"
  namespace          = "AWS/EC2"
  period             = 300
  statistic          = "Average"
  threshold         = 1024
  alarm_description = "Dispara um alarme se o tráfego de entrada ultrapassar o threshold"
  dimensions = {
    AutoScalingGroupName = module.autoscaling_group.autoscaling_group_name
  }
}

resource "aws_cloudwatch_metric_alarm" "asg_instances_low" {
  alarm_name          = "asg-low-instances"
  comparison_operator = "LessThanThreshold"
  evaluation_periods  = 2
  metric_name         = "GroupInServiceInstances"
  namespace          = "AWS/AutoScaling"
  period             = 300
  statistic          = "Average"
  threshold         = 2
  alarm_description = "Dispara um alarme se o número de instâncias ativas for menor que 2"

  dimensions = {
    AutoScalingGroupName = module.autoscaling_group.autoscaling_group_name
  }
}
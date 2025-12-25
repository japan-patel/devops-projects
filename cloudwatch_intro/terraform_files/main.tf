provider "aws" {
  shared_config_files      = ["/home/japan/.aws/config"]
  shared_credentials_files = ["/home/japan/.aws/credentials"]
  profile                  = "default"
}

#create cloud watch alarm 
resource "aws_cloudwatch_metric_alarm" "cpu_alarm" {
  alarm_name          = "cpu_70_alarm"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 120
  statistic           = "Average"
  threshold           = 70
  alarm_description   = "This metric monitors ec2 cpu utilization"

  alarm_actions = [aws_sns_topic.cpu_topic.arn]

  dimensions = {
    InstanceId = aws_instance.test_ec2.id
  }
}

#create SNS topic
resource "aws_sns_topic" "cpu_topic" {
  name = "cpu_utilization_topic"
}

#Subscribing email to topic
resource "aws_sns_topic_subscription" "cpu_topic_sub" {
  topic_arn = aws_sns_topic.cpu_topic.arn
  protocol  = "email"
  endpoint  = "email@domain.com"
}
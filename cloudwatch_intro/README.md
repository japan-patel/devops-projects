#Problem Statement#

1. Create a CloudWatch alarm that sends an email using SNS notification when CPU Utilization is more than 70%.

./terraform_files/cloudwatch_alarm.tf contains configuration for cloud watch alarm and SNS topic with subscription. Configuration uses InstanceId of ec2 to monitor ec2 instance

2. Creating a Status Check Alarm to check System and Instance failure and send an email using SNS notification
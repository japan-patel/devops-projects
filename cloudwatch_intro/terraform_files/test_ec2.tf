
# create an EC2 instance
resource "aws_instance" "test_ec2" {
  ami           = "ami-068c0051b15cdb816"
  instance_type = "t2.micro"
  user_data     = <<-EOF
            #!/bin/bash
            sudo yum update -y
            sudo yum install -y stress
            stress --cpu 1 --timeout 300
        EOF
}
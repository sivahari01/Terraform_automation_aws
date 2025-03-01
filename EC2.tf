resource "aws_instance" "docker_ec2" {
  ami                  = "ami-04b4f1a9cf54c11d0"
  instance_type        = "t2.micro"
  key_name             = "NewKey_310324"
  security_groups      = [aws_security_group.docker_sg.name]
  iam_instance_profile = aws_iam_instance_profile.s3_instance_profile.name

  user_data = <<-EOF
              user_data = <<-EOF
              #!/bin/bash
              
              # Update system package index
              sudo apt-get update -y
              
              # Install required packages
              sudo apt-get install -y unzip zip git
              
              # Install Docker using the recommended method
              sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common
              
              # Add Docker's official GPG key
              curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
              
              # Set up the stable Docker repository
              sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
              
              # Update the package index again
              sudo apt-get update -y
              
              # Install Docker CE (Community Edition)
              sudo apt-get install -y docker-ce
              
              # Start Docker service
              sudo systemctl start docker
              
              # Enable Docker to start on boot
              sudo systemctl enable docker
              
              # Add user to the docker group
              sudo usermod -aG docker ubuntu
              
              # Clone GitHub repo
              git clone https://github.com/sivahari01/JmeterRunGit.git /root/JmeterRunGit
              
              # Copy test file to root
              cp /root/JmeterRunGit/mytest.jmx /root/
              
              # Pull and run JMeter container
              sudo docker pull justb4/jmeter
              sudo docker run --rm -v /root/:/tests -v /root/:/results justb4/jmeter \
                -n -t /tests/mytest.jmx -l /results/results.jtl -e -o /results/html_report
              
              # Wait for test completion
              sleep 60s
              
              # Zip and upload results to S3
              cd /root
              zip -r html.zip html_report
              aws s3 cp html.zip s3://${aws_s3_bucket.s3buck.bucket}
              EOF

  tags = {
    Name = "Docker-EC2"
  }
}

resource "aws_security_group" "docker_sg" {
  name        = "docker-sg"
  description = "Allow SSH and Docker access"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Change for security
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

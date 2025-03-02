resource "aws_instance" "docker_ec2" {
  ami                  = "ami-04b4f1a9cf54c11d0"
  instance_type        = "t2.micro"
  key_name             = "NewKey_310324"
  security_groups      = [aws_security_group.docker_sg.name]
 # Handle count indexing properly

  user_data = <<-EOF
              #!/bin/bash -xe
              
              echo "Instance setup started..." | tee /tmp/cloud-init-start

              # Update system package index
              sudo apt-get update -y

              # Install required packages
              sudo apt-get install -y unzip zip git curl awscli docker.io

              # Start and enable Docker
              sudo systemctl start docker
              sudo systemctl enable docker

              # Add ubuntu user to the Docker group
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
              echo "Waiting for JMeter to complete..."
              sleep 60s

              # Zip and upload results to S3
              cd /root
              zip -r html.zip html_report

              # Ensure AWS CLI is available and upload results
              if aws s3 cp html.zip s3://${aws_s3_bucket.s3buck.bucket}; then
                echo "Results successfully uploaded to S3"
              else
                echo "S3 upload failed!" >&2
              fi

              # Mark completion
              touch /tmp/cloud-init-done
              echo "User data execution complete." | tee /tmp/cloud-init-log
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

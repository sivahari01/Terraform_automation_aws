resource "aws_instance" "docker_ec2" {
  ami           = "ami-04b4f1a9cf54c11d0"  # Amazon Linux 2 AMI (Change if needed)
  instance_type = "t2.micro"  # Choose an instance type as per requirements
  key_name      = "NewKey_310324"  # Replace with your existing key pair
  security_groups = [aws_security_group.docker_sg.name]

  user_data = <<-EOF
              #!/bin/bash
              sudo yum update -y
              sudo yum install -y docker
              sudo service docker start
              sudo usermod -aG docker ec2-user
              sudo chmod 666 /var/run/docker.sock
              
              # Verify Docker installation
              docker --version
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
    cidr_blocks = ["0.0.0.0/0"]  # Change to your IP for security
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

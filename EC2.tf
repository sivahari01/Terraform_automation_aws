resource "aws_instance" "docker_ec2" {
  ami                  = "ami-04b4f1a9cf54c11d0"
  instance_type        = "t2.micro"
  key_name             = "NewKey_310324"
  security_groups      = [aws_security_group.docker_sg.name]
 # Handle count indexing properly
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

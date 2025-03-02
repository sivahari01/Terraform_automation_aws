resource "aws_instance" "docker_ec2" {
  ami                  = "ami-04b4f1a9cf54c11d0"
  instance_type        = "t2.micro"
  key_name             = "NewKey_310324"
  security_groups      = [aws_security_group.docker_sg.name]
  iam_instance_profile = aws_iam_instance_profile.s3_instance_profile.name

  user_data = file("user-data.sh")

  provisioner "remote-exec" {
    inline = [
      "while [ ! -f /tmp/cloud-init-done ]; do echo 'Waiting for instance setup...'; sleep 30; done"
    ]
  }

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("your-key.pem")
    host        = self.public_ip
  }

  tags = {
    Name = "Docker-EC2"
  }
}

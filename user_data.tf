user_data = <<-EOF
              #!/bin/bash
              
              # Log everything
              exec > /var/log/user-data.log 2>&1
              
              # Update system package index
              sudo apt-get update -y
              
              # Install required packages
              sudo apt-get install -y unzip zip git
              
              # Install Docker
              sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common
              curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
              sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
              sudo apt-get update -y
              sudo apt-get install -y docker-ce
              
              # Start Docker service
              sudo systemctl start docker
              sudo systemctl enable docker
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

              # Signal completion to cloud-init
              touch /tmp/cloud-init-done
              EOF

🚀 Terraform-Based Automated Load Testing Framework on AWS
📌 Overview
This project automates the provisioning of AWS infrastructure using Terraform to deploy an EC2 instance, install Docker, run JMeter load tests, and store the results in an S3 bucket. The entire process is integrated into a Jenkins pipeline for seamless execution.

🎯 Objectives
Automate AWS resource provisioning (EC2, Security Groups, IAM, and S3) using Terraform.
Deploy JMeter in Docker on EC2 and execute load tests.
Store test results in an S3 bucket for further analysis.
Destroy AWS resources post-execution to optimize costs.

🏗️ Architecture
Terraform provisions:
An EC2 instance with required security groups.
IAM roles and S3 bucket for storing test results.
Docker on EC2 runs JMeter to execute test scripts.
JMeter test scripts are cloned from a GitHub repository and executed inside the Docker container.
Test results are uploaded to an S3 bucket.
Terraform destroys the infrastructure post-test to save costs.


⚙️ Prerequisites
Terraform (>= 1.0) installed
AWS CLI configured with necessary permissions
Jenkins with AWS credentials setup


Git installed
🚀 Deployment Steps
1️⃣ Clone the Repository

git clone https://github.com/yourusername/your-repo.git
cd your-repo
2️⃣ Initialize Terraform

terraform init
3️⃣ Plan and Apply Terraform Configuration

terraform plan
terraform apply -auto-approve
4️⃣ Verify the Setup
Retrieve the EC2 public IP:

terraform output ec2_public_ip
SSH into the EC2 instance and check Docker installation:

ssh -i your-key.pem ubuntu@<EC2_PUBLIC_IP>
docker --version
5️⃣ Run JMeter Tests
JMeter tests are executed automatically when Terraform provisions the EC2 instance.

6️⃣ Access Test Reports
Test results are uploaded to the specified S3 bucket. You can download them using:


aws s3 ls s3://your-s3-bucket/
aws s3 cp s3://your-s3-bucket/html_report.zip .
7️⃣ Destroy Resources (Post-Execution)


terraform destroy -auto-approve
🔥 Advantages of Using Terraform
✔ Infrastructure as Code (IaC) – Automates resource provisioning.
✔ Scalability – Modify configurations easily for different load tests.
✔ Cost-Effective – Resources are destroyed after execution.
✔ CI/CD Integration – Works seamlessly with Jenkins for automation.
✔ Repeatability – Ensures consistent infrastructure deployment.

pipeline {
    agent any
    environment {
        AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
    }
    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/sivahari01/DevopsLearn.git'
            }
        }
        stage('Terraform Init') {
            steps {
                sh 'terraform init'
                sh 'terraform apply -target=provider -auto-approve'
            }
        }
        stage('Terraform Apply EC2 & Security Group') {
            steps {
                sh 'terraform apply -target=EC2 -auto-approve'
            }
        }
        stage('Terraform Apply Bucket') {
            steps {
                sh 'terraform apply -bucket -auto-approve'
            }
        }
        stage('Terraform Apply S3 Upload  Bucket') {
            steps {
                sh 'terraform apply -target=aws_cpy -auto-approve'
            }
        }
        stage('Terraform Apply destroy') {
            steps {
                sh 'terraform destroy -auto-approve'
            }
        }
    }
}

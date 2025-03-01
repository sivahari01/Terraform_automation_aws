pipeline {
    agent any
    environment {
        AWS_REGION = 'us-east-1'  // Change this if needed
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
            }
        }
        stage('Terraform Plan') {
            steps {
                sh 'terraform plan'
            }
        }
        stage('Terraform Apply') {
            steps {
                sh 'terraform apply -auto-approve'
            }
        }
        stage('Terraform Destroy') {
            steps {
                input message: "Are you sure you want to destroy the infrastructure?", ok: "Yes"
                sh 'terraform destroy -auto-approve'
            }
        }
    }
}

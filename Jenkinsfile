pipeline {
    agent any
    environment {
        AWS_ACCESS_KEY_ID     = ''
        AWS_SECRET_ACCESS_KEY = ''
    }
    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/sivahari01/DevopsLearn.git'
            }
        }
        stage('Set AWS Credentials') {
            steps {
                withCredentials([aws(credentialsId: 'AWS_CREDENTIALS', 
                                     accessKeyVariable: 'AWS_ACCESS_KEY_ID', 
                                     secretKeyVariable: 'AWS_SECRET_ACCESS_KEY')]) {
                    script {
                        env.AWS_ACCESS_KEY_ID = AWS_ACCESS_KEY_ID
                        env.AWS_SECRET_ACCESS_KEY = AWS_SECRET_ACCESS_KEY
                    }
                }
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
                sh 'terraform apply -target=bucket -auto-approve'
            }
        }
        stage('Terraform Apply S3 Upload Bucket') {
            steps {
                sh 'terraform apply -target=aws_cpy -auto-approve'
            }
        }
        stage('Terraform Apply Destroy') {
            steps {
                sh 'terraform destroy -auto-approve'
            }
        }
    }
}

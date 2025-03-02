pipeline {
    agent any
    options {
        // Keep the last 5 builds
        buildDiscarder(logRotator(numToKeepStr: '2'))
    }
    environment {
        AWS_REGION = 'us-east-1'  // Set your preferred AWS region
    }
    stages {
        stage('Checkout') {
            steps {
                // Ensure this step is uncommented to pull the repository
                git 'https://github.com/sivahari01/DevopsLearn.git'
            }
        }
        stage('Set AWS Credentials') {
            steps {
                withCredentials([aws(credentialsId: 'AWS_CREDENTIALS', 
                                     accessKeyVariable: 'AWS_ACCESS_KEY_ID', 
                                     secretKeyVariable: 'AWS_SECRET_ACCESS_KEY')]) {
                    script {
                        echo "AWS Credentials Set"
                    }
                }
            }
        }
        stage('Terraform Init') {
            steps {
                // Initialize terraform
                sh 'terraform init'
            }
        }
        stage('Terraform Plan') {
            steps {
                // Add terraform plan execution here, for example:
                sh '''
                    terraform plan \
                      -var="AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID}" \
                      -var="AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY}"
                '''
            }
        }
        stage('Terraform Apply EC2 & Security Group') {
            steps {
                // Apply terraform configuration
                sh '''
                    terraform apply -auto-approve \
                      -var="AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID}" \
                      -var="AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY}"
                '''
                sh 'sleep 60s'
            }
        }
    }
  post {
        always {
            // Clean up workspace after every build
            cleanWs()
        }
    }
}

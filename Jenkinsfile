pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/sivahari01/DevopsLearn.git'
            }
        }
        stage('Debug AWS Credentials') {
            steps {
                withCredentials([aws(credentialsId: 'AWS Credentials', 
                                     accessKeyVariable: 'AWS_ACCESS_KEY_ID', 
                                     secretKeyVariable: 'AWS_SECRET_ACCESS_KEY')]) {
                    sh 'echo "AWS_ACCESS_KEY_ID is set"'
                }
            }
        }
        stage('Terraform Init') {
            steps {
                withCredentials([aws(credentialsId: 'AWS Credentials', 
                                     accessKeyVariable: 'AWS_ACCESS_KEY_ID', 
                                     secretKeyVariable: 'AWS_SECRET_ACCESS_KEY')]) {
                    sh 'terraform init'
                    sh 'terraform apply -auto-approve'
                }
            }
        }
    }
}

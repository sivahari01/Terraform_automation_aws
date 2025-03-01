pipeline {
    agent any
    environment {
        AWS_ACCESS_KEY_ID = credentials('AKIAQ3EGUVQ5JLPPSD5F')
        AWS_SECRET_ACCESS_KEY = credentials('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')
    }
    stages {
        stage('Checkout Code') {
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
                sh 'terraform plan -out=tfplan'
            }
        }
        stage('Terraform Apply') {
            steps {
                sh 'terraform apply -auto-approve tfplan'
            }
        }
    }
}

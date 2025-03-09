pipeline {
    agent any
    parameters {
        booleanParam(name: 'SKIP_STAGES_2_3', defaultValue: false, description: 'Skip Stages 2 and 3')
    }
    options {
        buildDiscarder(logRotator(numToKeepStr: '2')) // Keep the last 2 builds
    }
    environment {
        AWS_REGION = 'us-east-1'  // Set your preferred AWS region
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
                        sh '''
                        export AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID}
                        export AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY}
                        '''
                    }
                }
            }
        }
        stage('Terraform Init') {
            steps {
                withCredentials([aws(credentialsId: 'AWS_CREDENTIALS', 
                                     accessKeyVariable: 'AWS_ACCESS_KEY_ID', 
                                     secretKeyVariable: 'AWS_SECRET_ACCESS_KEY')]) {
                    script {
                        sh '''
                        export AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID}
                        export AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY}
                        terraform init
                        '''
                    }
                }
            }
        }
        stage('Terraform Plan') {
            when {
                expression { !params.SKIP_STAGES_2_3 }  // Skip if parameter is true
            }
            steps {
                withCredentials([aws(credentialsId: 'AWS_CREDENTIALS', 
                                     accessKeyVariable: 'AWS_ACCESS_KEY_ID', 
                                     secretKeyVariable: 'AWS_SECRET_ACCESS_KEY')]) {
                    script {
                        sh '''
                        export AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID}
                        export AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY}
                        terraform plan \
                          -var="AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID}" \
                          -var="AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY}"
                        '''
                    }
                }
            }
        }
        stage('Terraform Apply EC2 & Security Group') {
            when {
                expression { !params.SKIP_STAGES_2_3 }  // Skip if parameter is true
            }
            steps {
                withCredentials([aws(credentialsId: 'AWS_CREDENTIALS', 
                                     accessKeyVariable: 'AWS_ACCESS_KEY_ID', 
                                     secretKeyVariable: 'AWS_SECRET_ACCESS_KEY')]) {
                    script {
                        sh '''
                        export AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID}
                        export AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY}
                        terraform apply -auto-approve \
                          -var="AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID}" \
                          -var="AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY}"
                        '''
                        sh 'sleep 60s'
                    }
                }
            }
        }
    }
    post {
        always {
            sh "pwd" // Print working directory
        }
    }
}

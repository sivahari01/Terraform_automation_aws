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
                sh 'terraform plan'
            }
        }
        stage('Terraform Apply EC2 & Security Group') {
            steps {
               sh '''
                    terraform apply -auto-approve \
                      -var="AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID}" \
                      -var="AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY}"
                    '''

            }
        }
        stage('Terraform Apply Destroy') {
            steps {
                sh 'terraform destroy -auto-approve'
            }
        }
    }
}

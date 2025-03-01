pipeline {
    agent {
        docker {
            image 'hashicorp/terraform:latest'
        }
    }

    stages {
        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }
    }
}

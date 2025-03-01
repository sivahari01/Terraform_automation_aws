pipeline {
    agent any
    stages {
        stage('Terraform') {
            steps {
                sh 'docker run --rm -v $PWD:/workspace -w /workspace hashicorp/terraform:latest init'
                sh 'docker run --rm -v $PWD:/workspace -w /workspace hashicorp/terraform:latest plan'
                sh 'docker run --rm -v $PWD:/workspace -w /workspace hashicorp/terraform:latest apply -auto-approve'
            }
        }
    }
}

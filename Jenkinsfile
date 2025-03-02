pipeline {
    agent any
    stages {
        stage('Debug AWS Credentials') {
            steps {
                withCredentials([aws(credentialsId: 'AWS_CREDENTIALS', accessKeyVariable: 'AWS_ACCESS_KEY_ID', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY')]) {
                    sh 'echo "AWS_ACCESS_KEY_ID: $AWS_ACCESS_KEY_ID"'
                    sh 'echo "AWS_SECRET_ACCESS_KEY: $AWS_SECRET_ACCESS_KEY"'
                }
            }
        }
    }
}

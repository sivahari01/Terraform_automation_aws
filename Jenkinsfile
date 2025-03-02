pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/sivahari01/DevopsLearn.git'
            }
        }
        // Optional debugging stage to confirm environment variables are loaded
        stage('Debug Environment') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'AWS_CREDENTIALS', 
                                                    usernameVariable: 'AWS_ACCESS_KEY_ID', 
                                                    passwordVariable: 'AWS_SECRET_ACCESS_KEY')]) {
                    sh 'echo "AWS_ACCESS_KEY_ID length: ${#AWS_ACCESS_KEY_ID}"'
                }
            }
        }
    }
}

pipeline {
    agent any

    environment {
        // Ensure these IDs match the credentials you created in Jenkins.
        AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
    }

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/sivahari01/DevopsLearn.git'
            }
        }
        // Optional debugging stage to confirm environment variables are loaded
        stage('Debug Environment') {
            steps {
                sh 'echo "AWS_ACCESS_KEY_ID length: ${#AWS_ACCESS_KEY_ID}"'
            }
        }
    }
}

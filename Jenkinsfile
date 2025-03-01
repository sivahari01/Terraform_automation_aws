pipeline {
    agent any

    stages {
        stage('Install Terraform') {
            steps {
                sh '''
                    apt update
                    apt install -y wget gnupg software-properties-common
                    wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
                    echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/hashicorp.list
                    apt update
                    apt install -y terraform
                    terraform --version
                '''
            }
        }

        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }
    }
}

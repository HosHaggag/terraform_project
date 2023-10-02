pipeline {

    agent any

    stages {

        stage('Clone') {
            steps {
                git (url: 'https://github.com/HosHaggag/terraform_project.git' , branch: 'main')
            }
        }
        stage('Choose workspace') {
            steps {
                    echo 'Choosing workspace....'
                    sh 'terraform init  -reconfigure'
                    sh 'terraform workspace select dev'
                
            }
        }
        stage('Build and apply') {
            steps {
                    echo 'Building and applying....'
                    sh 'terraform init'
                    sh 'terraform plan --var-file=dev.tfvars'
                    sh 'terraform apply --var-file=dev.tfvars -auto-approve'
            }
        }
    }
}
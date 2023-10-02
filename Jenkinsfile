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
                dir('terraform_project') {
                    echo 'Choosing workspace....'
                    sh 'terraform init'
                    sh 'terraform workspace list'
                }
            }
        }
        stage('Build and apply') {
            steps {
                dir('terraform_project') {
                    echo 'Building and applying....'
                    sh 'terraform init'
                    sh 'terraform plan --var-file=dev.tfvars'
                    sh 'terraform apply --var-file=dev.tfvars -auto-approve'
                }
            }
        }
    }
}
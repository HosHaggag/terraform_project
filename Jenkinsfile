pipeline {

    agent any

    parameters {
        choice(name: 'workspace', choices: ["dev", "prod"], description: 'Select environment')
    }

    stages {
        stage('Choose workspace') {
            steps {
              script {
                echo 'Choosing workspace....'
                sh 'terraform init '
                sh "terraform workspace new ${params.workspace} || true" 
                sh "terraform workspace select ${params.workspace} "
              }            
            }
        }

        stage('plan') {
            steps {
                script {
                       sh "terraform plan --var-file=${params.workspace}.tfvars"
                }
            }
        }
        stage('plan and apply') {
            steps {
                    echo 'Building and applying....'
                    sh "terraform plan --var-file=${params.workspace}.tfvars"
                    sh "terraform apply --var-file=${params.workspace}.tfvars -auto-approve"
            }
        }
    }
}
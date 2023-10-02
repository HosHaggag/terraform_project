pipeline {

    agent any

    parameters {
        choice(name: 'operation', choices: ["build", "destroy"], description: 'Select operation')
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
        stage(' apply') {
            steps {
                script {
                    echo ' applying....'
                    if (params.operation == 'destroy') {
                        sh "terraform destroy --var-file=${params.workspace}.tfvars -auto-approve"
                        return
                    }
                    sh "terraform plan --var-file=${params.workspace}.tfvars"
                    sh "terraform apply --var-file=${params.workspace}.tfvars -auto-approve"
                }
            }
        }
    }
}
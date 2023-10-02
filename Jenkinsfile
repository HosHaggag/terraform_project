pipeline {
    agent any
    parameters {
        choice(name: 'server', choices: ["dev", "prod"], description: 'Select environment')
    }
    stages {
        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }
        stage('Terraform Plan and select workspace') {
            steps {
                script {
                    def env = params.server
                    

                    // check if workspace exists
                    if ( sh "terraform workspace list | grep -q ${env} " ) {
                        sh "terraform workspace new ${env} || true"
                    } 
                        sh "terraform workspace select ${env} "
                    

                    sh "terraform plan -var-file=${env}.tfvars"
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                script {
                    def env = params.server
                    sh "terraform apply -var-file=${env}.tfvars -auto-approve"
                }
            }
        }
    }
}
pipeline {

    agent any

    parameters {
        choice(name: 'workspace', choices: ["dev", "prod"], description: 'Select environment')
    }

    stages {

        stage('Clone') {
            steps {
                git (url: 'https://github.com/HosHaggag/terraform_project.git' , branch: 'main')
            }
        }
        stage('Choose workspace') {
            steps {
                script {
                env = "${params.workspace}"
                echo 'Choosing workspace....'
                sh 'terraform init '
                sh "terraform workspace new ${env} || true" 
                sh "terraform workspace select ${env} "
                }            
            }
        }

        stage('plan') {
            steps {
                       env = "${params.workspace}"
                       if (env == 'dev') {
                        tfVarsFile = 'dev.tfvars'
                        sh 'terraform workspace new Dev || true' 
                        sh 'terraform workspace select Dev '
                    } else if (env == 'prod') {
                        tfVarsFile = 'prod.tfvars'
                        sh 'terraform workspace new prod || true' 
                        sh 'terraform workspace select prod '
                    }
            }
        }
        // stage('Build and apply') {
        //     steps {
        //             echo 'Building and applying....'
        //             sh 'terraform plan --var-file=dev.tfvars'
        //             sh 'terraform apply --var-file=dev.tfvars -auto-approve'
        //     }
        // }
    }
}
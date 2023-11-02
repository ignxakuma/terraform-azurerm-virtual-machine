pipeline {
    agent any
    parameters {
        choice choices: ['No', 'Yes'], description: 'Do you want to use terraform destroy command?', name: 'Destroy_infra'
    }
    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/ignxakuma/terraform-azurerm-virtual-machine.git', credentialsId: 'gitpass', branch: 'master'
            }
        }
        stage('Terraform-Init') {
            steps {
                sh 'terraform init'
            }
        }
        stage('Terraform-plan') {
            steps {
                sh "terraform plan"
            }
        }
        stage('Terraform-apply') {
            when{
                expression
                {
                    return params.Destroy_infra == 'No'
                }
            }
            steps {
                sh "terraform apply --auto-approve"
            }
        }
        stage("Terraform-destroy")
        {
            when{
                expression
                {
                    return params.Destroy_infra == 'Yes'
                }
            }
            steps{
                sh "terraform destroy --auto-approve"
            }
        }           
    }
}

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
                sh 'cd examples/linux_virtual_machine && terraform init -no-color'
            }
        }
        stage('Terraform-plan') {
            steps {
                sh "cd examples/linux_virtual_machine && terraform plan -no-color"
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
                sh "cd examples/linux_virtual_machine && terraform apply -no-color -auto-approve"
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
                sh "cd examples/linux_virtual_machine && terraform destroy -no-color -auto-approve"
            }
        }           
    }
}

pipeline {
    agent any
    environment {
        AWS_ACCESS_KEY_ID     = credentials('aws-access-key-id')
        AWS_SECRET_ACCESS_KEY = credentials('aws-secret-access-key')
        AWS_DEFAULT_REGION    = 'us-east-1' // Change to match your preferred AWS region
    }
    stages {
        stage('Checkout Code') {
            steps {
                echo "🔹 Checking out repository..."
                git branch: 'main', url: 'https://github.com/zeweal/HelloApp'
            }
        }
        stage('Terraform Init') {
            steps {
                echo "🔹 Initializing Terraform..."
                sh 'terraform init -reconfigure'
            }
        }
        stage('Terraform Plan') {
            steps {
                echo "🔹 Creating Terraform plan..."
                sh 'terraform plan -out=tfplan'
            }
        }
        /* Uncomment this when you are ready to actually create infrastructure
        stage('Terraform Apply') {
            steps {
                echo "🔹 Applying Terraform..."
                sh 'terraform apply -auto-approve tfplan'
                echo "✅ Infrastructure deployed successfully!"
            }
        }
        */
        stage('Terraform Destroy') {
            steps {
                echo "🗑️ Destroying Terraform infrastructure..."
                sh 'terraform destroy -auto-approve'
                echo "🔥 Infrastructure destroyed successfully!"
            }
        }
    }
    post {
        success {
            echo "🎉 Pipeline completed successfully!"
        }
        failure {
            echo "❌ Pipeline failed!"
        }
    }
}

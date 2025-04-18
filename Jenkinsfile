pipeline {
    agent any

    environment {
        IMAGE_NAME = 'Dockerfile'
        IMAGE_TAG = 'latest'
    }

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/bhagyashreep032/docker-sample-java-webapp.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $IMAGE_NAME:$IMAGE_TAG .'
            }
        }

        stage('Deploy') {
            steps {
                sh 'docker run -p 8080:8080 --name my-container $IMAGE_NAME:$IMAGE_TAG'
            }
        }
    }
}

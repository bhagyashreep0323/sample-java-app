pipeline {
    agent any

    stages {
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t java-webapp:latest .'
            }
        }

        stage('Deploy') {
            steps {
                sh 'docker run -d --name java-webapp-container java-webapp:latest'
            }
        }
    }
}

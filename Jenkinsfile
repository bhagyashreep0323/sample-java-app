pipeline {
    agent any

    environment {
        IMAGE_NAME = 'java-webapp-push-image'
        DOCKER_HUB_USER = credentials('dockerhub-cred') // Using Jenkins credentials
    }

    stages {
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t java-webapp-push-image:latest .'
            }
        }

        stage('Push Docker Image') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub-cred', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    sh '''
                        echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin
                        docker tag java-webapp-push-image:latest $DOCKER_USER/java-webapp-push-image:latest
                        docker push $DOCKER_USER/java-webapp-push-image:latest
                    '''
                }
            }
        }

        stage('Deploy') {
            steps {
                sh 'docker run -d --name java-webapp java-webapp-push-image:latest'
            }
        }
    }
}

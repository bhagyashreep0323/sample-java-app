pipeline {
    agent any

    environment {
        IMAGE_NAME = 'java-webapp'
        DOCKER_HUB_USER = credentials('dockerhub-cred')
    }

    stages {

        stage('Check Docker Access') {
      steps {
        sh 'docker version'
      }
    }
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t java-webapp:latest .'
            }
        }

        stage('Push Docker Image') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub-cred', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    sh '''
                        echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin
                        docker tag java-webapp:latest $DOCKER_USER/java-webapp:latest
                        docker push $DOCKER_USER/java-webapp:latest
                    '''
                }
            }
        }

        stage('Deploy') {
            steps {
                sh 'docker run -d --name java-webapp-container java-webapp:latest'
            }
        }
    }
}

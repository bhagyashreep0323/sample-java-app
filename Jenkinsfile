pipeline {
    agent {
        label 'docker-agent'
    }

    environment {
        IMAGE_NAME = "my-java-app"
        CONTAINER_NAME = "java-app-container"
        VOLUME_NAME = "java-app-volume"
        PORT = "8080"
    }

    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    sh "docker build -t $IMAGE_NAME ."
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    sh """
                        docker volume create $VOLUME_NAME
                        docker rm -f $CONTAINER_NAME || true
                        docker run -d --name $CONTAINER_NAME -v $VOLUME_NAME:/app/data -p 8090:$PORT $IMAGE_NAME
                    """
                }
            }
        }
    }
}

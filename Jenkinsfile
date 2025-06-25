pipeline {
  agent {
    label 'docker-agent'
  }

  stages {
    stage('Clone Repo') {
      steps {
        git 'https://github.com/bhagyashreep0323/sample-java-app.git'
      }
    }

    stage('Build') {
      steps {
        sh './mvnw clean package'
      }
    }

    stage('Build Docker Image') {
      steps {
        sh 'docker build -t my-java-app .'
      }
    }

    stage('Run Container with Volume') {
      steps {
        sh '''
          docker volume create appdata
          docker run -d --name my-app-container -v appdata:/app/data -p 8081:8080 my-java-app
        '''
      }
    }
  }
}

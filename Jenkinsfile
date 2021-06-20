pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/spring-projects/spring-petclinic.git']]])
            }
        }
        stage('compile') {
            steps {
                sh '''
          echo "=== Compiling Project ==="
                    ./mvnw clean compile
                '''
            }
        }
    stage('package') {
            steps {
                sh '''
          echo "=== packaging Project ==="
          ./mvnw package
                '''
            }
        }
    stage('Build Docker Image') {
            steps {
                sh '''
                echo "=== Docker Image Build ==="
                docker-compose up -d
                '''
            }
        }
    stage('Push Docker Image') {
            withCredentials([usernamePassword(credentialsId: 'DockerHub', passwordVariable: 'docker_password', usernameVariable: 'docker_username')]) {
                sh 'docker login --username=$docker_username --password=$docker_password'
                sh 'docker push <hub-user>/<repo-name>:<tag>'
            }
        }
       
    }
}
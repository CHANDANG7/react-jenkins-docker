pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/CHANDANG7/react-jenkins-docker.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("chandancj7/react-app:${env.BUILD_ID}")
                }
            }
        }
        stage('Deploy with Docker Compose') {
            steps {
                script {
                    sh 'docker-compose down'
                    sh 'docker-compose up -d'
                }
            }
        }
    }
    post {
        always {
            sh 'docker-compose down'
        }
    }
}

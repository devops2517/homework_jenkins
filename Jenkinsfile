pipeline {
    agent any
    tools {
        maven "m3"
    }
    stages {
        stage ('git') {
            steps {
                git 'https://github.com/boxfuse/boxfuse-sample-java-war-hello.git'
            }
        }

        stage('build') {
            steps {
                sh 'mvn package'
            }
            post {
                success {
                    archiveArtifacts 'target/*.war'
                }
            }
        }

        stage('Build Docker image') {
            steps {
                sh 'docker build -t devops2517/homework_jenkins:latest .'
            }

            post {
                success {
                    sh 'docker push devops2517/homework_jenkins:latest'
                }
            }
        }
    }
}
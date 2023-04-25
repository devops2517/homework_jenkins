pipeline {
    agent { label 'build' }

    stages {
        stage('Clone repository') {
            steps {
                checkout git: 'https://github.com/boxfuse/boxfuse-sample-java-war-hello.git'
            }
        }

        stage('Build WAR package') {
            steps {
                sh './mvnw package -DskipTests=true'
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
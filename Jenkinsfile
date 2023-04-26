pipeline {
    agent any
    tools {
            maven "m3"
            'org.jenkinsci.plugins.docker.commons.tools.DockerTool' "docker"
        }

    stages {
        stage('Checkout') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/master']], userRemoteConfigs: [[url: 'https://github.com/boxfuse/boxfuse-sample-java-war-hello.git']]])
            }
        }

        stage('Build') {
            steps {
                sh 'mvn package'
            }
            post {
                success {
                    archiveArtifacts 'target/*.war'
                }
            }
        }

        stage('Docker build and push') {
            steps {
                withDockerRegistry([credentialsId: 'dockerhub', url: 'https://registry.hub.docker.com']) {
                    sh 'docker build -t devops2517/homework_jenkins:latest .'
                    sh 'docker push devops2517/homework_jenkins:latest'
                }
            }
        }

        stage('Deploy') {
            environment {
                TAG = 'devops2517/homework_jenkins:latest'
            }
            steps {
                sh 'docker pull $TAG'
                sh 'docker run -p 8080:8080 $TAG'
            }
        }
    }
}
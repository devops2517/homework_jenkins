pipeline {
    agent any
    tools {
        maven "m3"
        'org.jenkinsci.plugins.docker.commons.tools.DockerTool' "docker"
    }
    stages {
        stage('git') {
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
                    archiveArtifacts artifacts: 'target/*.war'
                }
            }
        }
        stage('dockerfile') {
            steps {
                git branch: 'main', url: 'https://github.com/devops2517/homework_jenkins.git'
            }
        }
         stage('Build Docker image') {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'dockerhub-credentials') {
                        def dockerImage = docker.build("devops2517/homework_jenkins:latest", ".")
                        dockerImage.push()
                    }
                }
            }
        }
    }
}

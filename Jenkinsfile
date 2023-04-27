pipeline {
    agent any
    tools {
            maven "m3"
            'org.jenkinsci.plugins.docker.commons.tools.DockerTool' "docker"
        }
    stages {
           stage('Checkout') {
               steps {
                   git 'https://github.com/boxfuse/boxfuse-sample-java-war-hello.git'
               }
           }
           stage('Build .war') {
               steps {
                   sh 'mvn package'
               }
           }
           stage('Build Docker Image') {
               steps {
                   script {
                       def dockerImage = docker.build 'devops2517/homework_jenkins:latest'
                       dockerImage.inside {
                           sh 'cp -r /usr/src/app/target/*.war .'
                       }
                       dockerImage.withRegistry('https://registry.hub.docker.com', 'dockerhub') {
                           dockerImage.push()
                       }
                   }
               }
           }
           stage('Deploy Docker Image') {
               agent {
                   node {
                       label 'production'
                   }
               }
               steps {
                   sh 'docker pull devops2517/homework_jenkins:latest'
                   sh 'docker run -d --restart always -p 8080:8080 devops2517/homework_jenkins:latest'
               }
           }
       }
   }
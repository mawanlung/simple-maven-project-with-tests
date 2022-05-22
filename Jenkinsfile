#!groovy

pipeline {
  agent none
  stages {
    
    stage('Initialize'){
        def dockerHome = tool 'myDocker'
        env.PATH = "${dockerHome}/bin:${env.PATH}"
    }
    stage('Maven Install') {
      agent {
        docker {
          image 'maven:3.5.0'
        }
      }
      steps {
        sh 'mvn clean install -DskipTests'
        echo 'jar created'
        sh 'ls -l'
        sh 'docker ps'
        echo 'docker created'
      }
    }
  }
}

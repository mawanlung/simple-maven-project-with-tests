#!groovy

pipeline {
  agent none
  tools { 'myDocker' 
    }
  stages {
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

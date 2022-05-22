#!groovy

pipeline {
  agent none
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
        sh 'docker build -t simple-maven-project-with-tests:latest .'
        echo 'docker created'
      }
    }
  }
}

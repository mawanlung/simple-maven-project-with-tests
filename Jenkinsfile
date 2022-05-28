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
        sh 'mvn -e clean install'
      }
    }
    stage('Docker Build') {
      agent any
      steps {
        sh 'docker build -t simple-maven-project-with-tests:latest .'
      }
    }
    stage('Docker Push') {
      agent any
      steps {
        withCredentials([usernamePassword(credentialsId: 'dockerHub', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
          sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
          sh 'docker push hub.docker.com:5000/mawanlung/simple-maven-project-with-tests:latest'
        }
      }
    }
    
  }
}

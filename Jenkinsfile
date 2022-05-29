pipeline {
  agent any
  stages {
    stage('Maven Install') {
      steps {
 withMaven(
        // Maven installation declared in the Jenkins "Global Tool Configuration"
        maven: 'apache-maven-3.8.5', // (1)
        // Use `$WORKSPACE/.repository` for local repository folder to avoid shared repositories
        mavenLocalRepo: '/Users/macos/.m2/repository', // (2)
        // Maven settings.xml file defined with the Jenkins Config File Provider Plugin
        // We recommend to define Maven settings.xml globally at the folder level using
        // navigating to the folder configuration in the section "Pipeline Maven Configuration / Override global Maven configuration"
        // or globally to the entire master navigating to  "Manage Jenkins / Global Tools Configuration"
        mavenSettingsConfig: '/Users/macos/.m2/settings.xml' // (3)
    ) {

      // Run the maven build
      sh "mvn -e clean install"

    } 
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

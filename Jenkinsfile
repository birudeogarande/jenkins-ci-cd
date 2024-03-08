pipeline {
    agent any

    tools {
        maven "maven"
    }

    stages {
        stage('Checkout from Github') {
            steps {
               checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/birudeogarande/jenkins-ci-cd.git']])
            }

        }
     stage("Build"){
         steps {
               script{
                    bat 'mvn clean install'
               }
            }
     }
     
    }
    post{
        always{
      
               emailext attachLog: true, body: 'JenkinFile-CI-CD - Build #${BUILD_NUMBER} - ${BUILD_STATUS}', replyTo: 'birudeogarande@gmail.com', subject: 'JenkinFile-CI-CD - Build #${BUILD_NUMBER} - ${BUILD_STATUS}', to: 'birudeo.garande.bmc@gmail.com'
            }
        }
}

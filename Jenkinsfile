pipeline {
    agent any

    tools {
        maven "maven"
        jdk 'JAVA_HOME'
    }

    environment{
    APP_NAME="biru1234/my-app"
    TAG_NAME="1.0.0-"+"${BUILD_NUMBER}"
    IMAGE_NAME="${APP_NAME}:${TAG_NAME}"
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
                    sh 'mvn clean install'
               }
            }
     }
     
         stage('Build docker image'){
            steps{
                sh 'export PATH=$PATH:~/.docker/bin'
                sh 'docker build -t ${IMAGE_NAME} .'
            }
        }
        stage('Deploy docker image') {
            steps {
                withCredentials([string(credentialsId: 'token-docker', variable: 'token')]) {
                    sh 'docker login -u biru1234 -p ${token}'
                    sh 'docker push ${IMAGE_NAME}'
                }
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

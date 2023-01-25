pipeline {

    agent any

    environment {
        imageName = "finalproject"
        registryCredentials = "finalproject"
        registry = "a945746d2929a40b7a4372cfccbe4da4-1631408939.ap-northeast-2.elb.amazonaws.com"
        dockerImage = ''
    }

    stages {
        stage('Code checkout') {
            steps {
              checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: 'db83fc5d-83fc-45c3-837c-dfb0d30b7f6f', url: 'https://github.com/dohokwak/finaltest.git']])                  }
        }

    // Building Docker images
    stage('Building image') {
      steps{
        script {
          dockerImage = docker.build imageName
        }
      }
    }

    // Uploading Docker images into Nexus Registry
    stage('Uploading to finalproject') {
     steps{
         script {
             docker.withRegistry( 'http://'+registry, registryCredentials ) {
             dockerImage.push('latest')
          }
        }
      }
    }
    stage('Deploy to kubernetes'){
        steps{
            script{
                kubernetesDeploy(configs: "finalproject.yaml", kubeconfigId: "kubernetes")
            }
        }
    }

    }
}

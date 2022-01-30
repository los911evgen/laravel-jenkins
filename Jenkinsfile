pipeline {
    agent any
    environment {
      registry = "los911/laravel-jenkins"
      registryCredential = 'dockerhub'
      dockerImage = ''
    }
    stages {
        stage('Checkout Source') {
            steps {
                git credentialsId: 'github', url:'https://github.com/los911evgen/laravel-jenkins.git', branch:'main'
             }
        }
        stage('Building image') {
            steps{
              script {
                dockerImage = docker.build registry + ":$BUILD_NUMBER"
              }
            }
        }
        stage('Deploy Image') {
          steps{
            script {
              docker.withRegistry( '', registryCredential ) {
              dockerImage.push()
              }
            }
          }     
        }
        stage('Тестирование') {
            steps {
                echo 'Тестируем нашу сборку'
            }
        }
        stage('Push image to registry') {
          steps{
            script {
              docker.withRegistry( '', registryCredential ) {
              dockerImage.push()
              }
            }
          }     
        }
        stage('Развертывание') {
            steps {
                echo 'Переносим код в рабочую среду или создаем артефакт'
            }
        }
    }
}

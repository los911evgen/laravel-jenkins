pipeline {
    agent any
    environment {
      registry = "los911/laravel-jenkins"
      registryCredential = 'dockerhub'
      dockerImage = ''
    }
    stages {
        stage('Checkout') {
            steps {
                git credentialsId: 'github', url:'https://github.com/los911evgen/laravel-jenkins.git', branch:'main'
             }
        }
        stage('Сборка образа') {
            steps{
              script {
                dockerImage = docker.build registry + ":$BUILD_NUMBER"
              }
            }
        }
        stage('Тестирование') {
            steps {
                echo 'Здесь будет тестирование кода и тп'
            }
        }
        stage('Публикация в registry') {
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
                sh './deploy.sh'
            }
        }
    }
}

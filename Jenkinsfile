pipeline {
    agent { docker { image 'python:latest' } }

    stages {
        stage('Checkout Source') {
            steps {
                git credentialsId: 'semyonb20', url:'https://github.com/los911evgen/laravel-jenkins.git', branch:'main'
             }
        }
        stage('Подготовка') {
            steps {
                sh "python --version"
            }
        }
        stage('Сборка') {
            steps {
                echo 'Выполняем команды для сборки'
            }
        }
        stage('Тестирование') {
            steps {
                echo 'Тестируем нашу сборку'
            }
        }
        stage('Развертывание') {
            steps {
                echo 'Переносим код в рабочую среду или создаем артефакт'
            }
        }
    }
}

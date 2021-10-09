pipeline {
    environment {
        mavenHome = tool 'localMaven'
        registry = 'trinichacon/achistar-program'
        registryCredential = 'MyDockerHubID'
        dockerImage = ''
    }

    agent any

    stages {
        stage ("Git Clone") {
            steps {
                git url: 'https://github.com/trinichacon/Final-Project.git'
            }
        }

        stage ("Maven Clean Package") {
            steps {
                sh "${mavenHome}/bin/mvn clean package"
            }
        }

        stage ("Build Docker Image") {
            steps {
                script {
                    dockerImage = docker.build registry + ":b$BUILD_NUMBER"
                }
            }
        }

        stage ("Deploy Docker Image") {
            steps {
                script {
                    docker.withRegistry( '', registryCredential ) {
                        dockerImage.push()
                    }
                }
            }
        }
    }
}


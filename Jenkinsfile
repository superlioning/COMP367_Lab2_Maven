pipeline {
    agent any

    tools {
        maven 'M3'
    }

    environment {
        DOCKER_CREDENTIALS_ID = 'dockerHubCredentials'
        IMAGE_TAG = "lioning/comp367_maven:${env.BUILD_ID}"
    }

    triggers {
        pollSCM('H/5 * * * *')
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage('Test and Code Coverage') {
            steps {
                sh 'mvn test jacoco:report'
            }
            post {
                always {
                    jacoco()
                }
            }
        }

        stage('Docker Build') {
            steps {
                script {
                    docker.build(IMAGE_TAG)
                }
            }
        }

        stage('Docker Login') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', DOCKER_CREDENTIALS_ID) {
                    }
                }
            }
        }

        stage('Docker Push') {
            steps {
                script {
                    docker.image(IMAGE_TAG).push()
                }
            }
        }
    }
}

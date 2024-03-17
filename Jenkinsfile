pipeline {
    agent any

    tools {
        maven 'M3'
    }

    environment {
        DOCKERHUB_PWD=credentials('CredentialID_DockerHubPWD')
        IMAGE_TAG = "lioning/comp367_maven:${env.BUILD_ID}"
    }

    triggers {
        pollSCM('H/5 * * * *')
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/superlioning/COMP367_Lab2_Maven'
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
                    sh "docker build -t ${IMAGE_TAG} ."
                }
            }
        }

        stage('Docker Login') {
            steps {
                script {
                    sh "docker login -u lioning -p ${DOCKERHUB_PWD}"
                }
            }
        }

        stage('Docker Push') {
            steps {
                script {
                    sh "docker push ${IMAGE_TAG}"
                }
            }
        }
    }
}

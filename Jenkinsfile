pipeline {
    agent any

    tools {
            maven "M3"
        }

    stages {
        stage('Build') {
            steps {
                echo 'Building..'
                // Runs a Maven build
                sh 'mvn clean package'
            }
        }
    }
}
pipeline {
    agent any

    tools {
        maven "M3"
    }

    triggers {
        // Polls SCM every 5 minutes
        pollSCM('H/5 * * * *')
    }

    stages {
        stage('Build') {
            steps {
                echo 'Building..'
                sh 'mvn clean package'
            }
        }
    }
}
pipeline {
    agent any

    tools {
        // Install the Maven version configured as "M3" and add it to the path.
        maven "Maven3.6.3"
    }

    stages {
        stage('SCM') {
            steps {
                git 'https://github.com/mukesh-cel/DevOps-Project.git'
            }
        }
        stage('Build') {
            steps {
                sh "mvn clean package"
            }
        }
  }
}

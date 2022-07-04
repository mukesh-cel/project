pipeline {
    agent any

    tools {
        // Install the Maven version configured as "M3" and add it to the path.
        maven "Maven3.6.3"
    }

    stages {
        stage('SCM') {
            steps {
               checkout scm
            }
        }
        stage('Maven Build') {
            steps {
                sh "mvn clean package"
            }
        }
        stage('docker Build') {
            steps {
                sh "docker build -t mukesh1997/project:$BUILD_NUMBER ."
                   echo "Docker image build complete"
            }
        }
  }
}

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
        stage ('Docker push') {
            steps {
                script {
                   withCredentials([string(credentialsId: 'Dockerhubcreds', variable: 'dockerhubcreds')]) {
                   sh "docker login -u mukesh1997 -p ${dockerhubcreds}"
                   sh "docker push mukesh1997/project:$BUILD_NUMBER"
                   echo "docker push complete"
}
}
}
}
  }
}

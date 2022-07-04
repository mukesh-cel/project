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
        stage('docker Image Build') {
            steps {
                sh "docker build -t mukesh1997/project:$BUILD_NUMBER ."
                   echo "Docker image build complete"
            }
        }
<<<<<<< HEAD
        stage ('Docker push to DockerHub') {
=======
        stage ('Docker push') {
>>>>>>> 023dd910f43cf56ec1b6fb161942aa10cc3a1a5e
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
        stage ('Docker Container Build') {
            steps {
                sh "docker rm project:$BUILD_NUMBER -f"
                sh "docker pull mukesh1997/project:$BUILD_NUMBER"
                sh "docker build -itd -p 8070:8070 --name MUKESH mukesh1997/project:$BUILD_NUMBER"
                echo "Docker Image build successfully"
}
}
  }
}

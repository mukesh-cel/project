def containerName="docker-pipeline"
def OldID="docker ps -a | grep -i $containerName"

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
                sh "docker build -t mukesh1997/$containerName:$BUILD_NUMBER ."
                   echo "Docker image build complete"
            }
        }
        stage ('Docker push to DockerHub') {
            steps {
                script {
                   withCredentials([string(credentialsId: 'Dockerhubcreds', variable: 'dockerhubcreds')]) {
                   sh "docker login -u mukesh1997 -p ${dockerhubcreds}"
                   sh "docker push mukesh1997/$containerName:$BUILD_NUMBER"
                   echo "docker push complete"
}
}
}
}
        stage ('Docker Container Build') {
            steps {
                sh "docker rm $OldID -f"
                sh "docker pull mukesh1997/$containerName:$BUILD_NUMBER"
                sh "docker run -itd -p 8070:8070 --name $containerName mukesh1997/$containerName:$BUILD_NUMBER"
                echo "Docker Image build successfully"
}
}
  }
}

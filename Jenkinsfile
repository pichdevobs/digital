pipeline {
    agent any
    stages {
        stage('Build Docker Image') {
            steps {
                echo "Step 1: Starting docker build ..."
                script{
                    sh 'docker build -t pichhub/digital:latest .'
                }
            }
        }
        stage('Push Docker to Registry') {
            steps {
                echo "Step 2: Push image to registry ..."
                withCredentials([usernamePassword(credentialsId: 'CredentialDockerHub', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                    sh '''
                        echo "Logging into Docker registry..."
                        docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD
                        echo "Pushing Docker image to registry..."
                        docker push pichhub/digital:latest
                    '''
                }
            }
        }
        stage('Execute deployment script') {
            steps {
                echo "Step 3: Starting deployment script ..."
                sh 'ssh root@172.31.26.159 /opt/myscripts/deploydigital.sh'
            }
        }
    }
}






























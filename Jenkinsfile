pipeline {
    agent any

    environment {
        
        DOCKER_HUB_USER = 'pavithrak02
'
        APP_NAME        = 'fibonacci-java'
        IMAGE_NAME      = "${DOCKER_HUB_USER}/${APP_NAME}"
    }

    stages {
        stage('Clone') {
            steps {
                checkout scm
            }
        }

        stage('Build Image') {
            steps {
                script {
                    // This uses your Dockerfile to build the image
                    sh "docker build -t ${IMAGE_NAME}:${env.BUILD_NUMBER} ."
                    sh "docker tag ${IMAGE_NAME}:${env.BUILD_NUMBER} ${IMAGE_NAME}:latest"
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                // 'docker-hub-creds' is the ID we will create in Step 3
                withCredentials([usernamePassword(credentialsId: 'docker-hub-creds', 
                                 passwordVariable: 'PASS', 
                                 usernameVariable: 'USER')]) {
                    sh "echo \$PASS | docker login -u \$USER --password-stdin"
                    sh "docker push ${IMAGE_NAME}:${env.BUILD_NUMBER}"
                    sh "docker push ${IMAGE_NAME}:latest"
                }
            }
        }
    }
}

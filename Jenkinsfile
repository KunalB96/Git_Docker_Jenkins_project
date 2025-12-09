pipeline {
    agent any
    
    environment {
        DOCKER_HUB_REPO = 'atuljkamble/basic-webapp'
        DOCKER_HUB_CREDENTIALS = 'dockerhub-credentials' // Jenkins credential ID
        GIT_REPO = 'https://github.com/atulkamble/git-docker-jenkins-project.git'
        IMAGE_TAG = "${BUILD_NUMBER}"
    }
    
    stages {
        stage('Checkout') {
            steps {
                echo 'Checking out code from Git...'
                git branch: 'main', url: "${GIT_REPO}"
            }
        }
        
        stage('Build') {
            steps {
                echo 'Building Docker image...'
                script {
                    dockerImage = docker.build("${DOCKER_HUB_REPO}:${IMAGE_TAG}")
                    docker.build("${DOCKER_HUB_REPO}:latest")
                }
            }
        }
        
        stage('Test') {
            steps {
                echo 'Running tests...'
                script {
                    // Run container and test API endpoint
                    sh """
                        docker run -d --name test-container -p 3001:3000 ${DOCKER_HUB_REPO}:${IMAGE_TAG}
                        sleep 5
                        curl -f http://localhost:3001/api/hello || exit 1
                        docker stop test-container
                        docker rm test-container
                    """
                }
            }
        }
        
        stage('Push to Docker Hub') {
            steps {
                echo 'Pushing Docker image to Docker Hub...'
                script {
                    docker.withRegistry('https://registry.hub.docker.com', "${DOCKER_HUB_CREDENTIALS}") {
                        dockerImage.push("${IMAGE_TAG}")
                        dockerImage.push("latest")
                    }
                }
            }
        }
        
        stage('Deploy') {
            steps {
                echo 'Deploying application...'
                script {
                    sh """
                        docker stop basic-webapp || true
                        docker rm basic-webapp || true
                        docker run -d --name basic-webapp -p 3000:3000 ${DOCKER_HUB_REPO}:latest
                    """
                }
            }
        }
        
        stage('Health Check') {
            steps {
                echo 'Performing health check...'
                script {
                    sh """
                        sleep 5
                        curl -f http://localhost:3000/api/hello || exit 1
                        echo "Application is healthy!"
                    """
                }
            }
        }
    }
    
    post {
        always {
            echo 'Cleaning up...'
            sh 'docker system prune -f'
        }
        success {
            echo 'Pipeline completed successfully!'
        }
        failure {
            echo 'Pipeline failed!'
        }
    }
}

pipeline {
    agent any

    environment {
        GIT_REPO = 'https://github.com/KunalB96/Git_Docker_Jenkins_project.git'
        DOCKER_IMAGE = 'kunalb96/basic-webapp'
        DOCKER_CREDENTIALS = 'docker_credentials'   // Must match Jenkins credential ID
    }

    stages {

        stage('Checkout') {
            steps {
                echo 'Checking out code...'
                git branch: 'main', url: "${GIT_REPO}"
            }
        }

        stage('Build Image') {
            steps {
                echo "Building Docker image..."
                script {
                    dockerImage = docker.build("${DOCKER_IMAGE}:${BUILD_NUMBER}")
                }
            }
        }

        stage('Test') {
            steps {
                echo "Running tests..."
                script {
                    sh """
                        docker run -d --name test-container -p 3001:3000 ${DOCKER_IMAGE}:${BUILD_NUMBER}
                        sleep 5
                        curl -f http://localhost:3001/api/hello
                        docker stop test-container
                        docker rm test-container
                    """
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                echo "Pushing Docker Image to Docker Hub..."
                script {
                    docker.withRegistry('https://index.docker.io/v1/', "${DOCKER_CREDENTIALS}") {
                        dockerImage.push("${BUILD_NUMBER}")
                        dockerImage.push("latest")
                    }
                }
            }
        }

        stage('Deploy') {
            steps {
                echo "Deploying latest image..."
                script {
                    sh """
                        docker stop basic-webapp || true
                        docker rm basic-webapp || true
                        docker run -d --name basic-webapp -p 3000:3000 ${DOCKER_IMAGE}:latest
                    """
                }
            }
        }

        stage('Health Check') {
            steps {
                echo "Checking health..."
                sh """
                    sleep 5
                    curl -f http://localhost:3000/api/hello
                """
            }
        }
    }

    post {
        always {
            echo "Cleaning up..."
            sh "docker system prune -f"
        }
        success {
            echo "Pipeline completed successfully!"
        }
        failure {
            echo "Pipeline failed!"
        }
    }
}

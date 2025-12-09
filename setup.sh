#!/bin/bash

# Setup script for git-docker-jenkins-project

echo "=== Basic Webapp Setup ==="
echo ""

# Function to check if command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Check prerequisites
echo "Checking prerequisites..."
if ! command_exists node; then
    echo "❌ Node.js is not installed. Please install Node.js 18+"
    exit 1
fi

if ! command_exists docker; then
    echo "❌ Docker is not installed. Please install Docker"
    exit 1
fi

if ! command_exists git; then
    echo "❌ Git is not installed. Please install Git"
    exit 1
fi

echo "✅ All prerequisites installed"
echo ""

# Menu
echo "Select an option:"
echo "1. Install npm dependencies"
echo "2. Run application locally (npm start)"
echo "3. Build Docker image"
echo "4. Run with Docker Compose"
echo "5. Push to GitHub"
echo "6. Exit"
echo ""
read -p "Enter choice [1-6]: " choice

case $choice in
    1)
        echo "Installing npm dependencies..."
        npm install
        ;;
    2)
        echo "Starting application locally..."
        npm start
        ;;
    3)
        echo "Building Docker image..."
        docker build -t atuljkamble/basic-webapp:latest .
        echo "✅ Image built successfully!"
        echo "Run with: docker run -p 3000:3000 atuljkamble/basic-webapp:latest"
        ;;
    4)
        echo "Starting with Docker Compose..."
        docker-compose up -d
        echo "✅ Application started!"
        echo "View logs: docker-compose logs -f"
        echo "Stop: docker-compose down"
        ;;
    5)
        echo "Pushing to GitHub..."
        git push -u origin main
        echo "✅ Pushed to GitHub!"
        ;;
    6)
        echo "Exiting..."
        exit 0
        ;;
    *)
        echo "Invalid choice"
        exit 1
        ;;
esac

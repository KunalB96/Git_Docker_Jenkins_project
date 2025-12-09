# Deployment Guide

## ✅ Current Status

- **Git Repository**: Initialized and committed
- **Docker Image**: Built successfully (`atuljkamble/basic-webapp:latest`)
- **Container**: Running on port 3000
- **API Tested**: ✅ Working (`http://localhost:3000/api/hello`)

## 🚀 Quick Commands

### Local Development
```bash
npm install
npm start
# Open http://localhost:3000
```

### Docker Commands
```bash
# Build image
docker build -t atuljkamble/basic-webapp:latest .

# Run container
docker run -d -p 3000:3000 --name basic-webapp atuljkamble/basic-webapp:latest

# View logs
docker logs basic-webapp

# Stop container
docker stop basic-webapp
docker rm basic-webapp

# Or use Docker Compose
docker-compose up -d
docker-compose down
```

### Test Endpoints
```bash
# API endpoint
curl http://localhost:3000/api/hello

# Web interface
open http://localhost:3000
```

## 📤 Push to Repositories

### 1. Push to GitHub
```bash
# Create repo first at: https://github.com/new
# Name: git-docker-jenkins-project

git push -u origin main
```

### 2. Push to Docker Hub
```bash
# Login to Docker Hub
docker login

# Tag image (if needed)
docker tag atuljkamble/basic-webapp:latest atuljkamble/basic-webapp:v1.0

# Push to Docker Hub
docker push atuljkamble/basic-webapp:latest
docker push atuljkamble/basic-webapp:v1.0
```

## 🔧 Jenkins Setup

### Prerequisites
1. Jenkins server with Docker installed
2. Required plugins:
   - Docker Pipeline
   - Git Plugin
   - Pipeline Plugin

### Setup Steps

1. **Add Docker Hub Credentials in Jenkins**:
   ```
   Manage Jenkins → Credentials → System → Global credentials
   - Kind: Username with password
   - ID: dockerhub-credentials
   - Username: atuljkamble
   - Password: <your-docker-hub-token>
   ```

2. **Create Pipeline Job**:
   ```
   New Item → Pipeline
   - Name: basic-webapp-pipeline
   - Pipeline script from SCM
   - SCM: Git
   - Repository URL: https://github.com/atulkamble/git-docker-jenkins-project.git
   - Branch: */main
   - Script Path: Jenkinsfile
   ```

3. **Run Pipeline**:
   - Click "Build Now"
   - Monitor pipeline stages

### Pipeline Stages
```
Checkout → Build → Test → Push to Docker Hub → Deploy → Health Check
```

## 🔍 Verification Checklist

- [x] Code files created
- [x] Git repository initialized
- [x] package-lock.json generated
- [x] Docker image built successfully
- [x] Container running on port 3000
- [x] API endpoint responding correctly
- [ ] Pushed to GitHub
- [ ] Pushed to Docker Hub
- [ ] Jenkins pipeline configured

## 📝 Next Steps

1. **Create GitHub repository**:
   - Go to https://github.com/new
   - Repository name: `git-docker-jenkins-project`
   - Make it public or private
   - Don't initialize with README (we already have one)

2. **Push code**:
   ```bash
   git push -u origin main
   ```

3. **Push Docker image**:
   ```bash
   docker login
   docker push atuljkamble/basic-webapp:latest
   ```

4. **Setup Jenkins**:
   - Follow Jenkins Setup section above
   - Configure credentials
   - Create pipeline job
   - Run first build

## 🐛 Troubleshooting

### Port Already in Use
```bash
# Find process using port 3000
lsof -i :3000

# Or stop existing container
docker stop basic-webapp
docker rm basic-webapp
```

### Docker Build Fails
```bash
# Ensure package-lock.json exists
ls -la package-lock.json

# If missing, run:
npm install
```

### Container Won't Start
```bash
# Check logs
docker logs basic-webapp

# Check if image exists
docker images | grep basic-webapp
```

## 📊 Monitoring

### Container Status
```bash
docker ps | grep basic-webapp
docker stats basic-webapp
```

### Health Check
```bash
curl http://localhost:3000/api/hello
```

## 🔒 Security Notes

- Container runs as non-root user (nodejs:1001)
- Health checks configured
- Multi-stage build for smaller image size
- Dev dependencies excluded from production image

## 📦 Image Details

- **Base Image**: node:18-alpine
- **Size**: ~150MB (multi-stage optimized)
- **Port**: 3000
- **User**: nodejs (non-root)
- **Health Check**: Configured

---

**Repository**: https://github.com/atulkamble/git-docker-jenkins-project  
**Docker Hub**: https://hub.docker.com/r/atuljkamble/basic-webapp

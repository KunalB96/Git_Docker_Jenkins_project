<<<<<<< HEAD
# Basic Webapp

A minimal Express server with static frontend, Docker support, and Jenkins CI/CD pipeline.

## Quick Start (Local)

```bash
npm install
npm start
```

Open http://localhost:3000

## Docker Quick Start

### Build and Run with Docker

```bash
docker build -t atuljkamble/basic-webapp:latest .
docker run -d -p 3000:3000 --name basic-webapp atuljkamble/basic-webapp:latest
```

### Using Docker Compose

```bash
docker-compose up -d
docker-compose logs -f
docker-compose down
```

## Git Setup

### Initialize and Push to GitHub

```bash
git add .
git commit -m "Initial commit: Basic webapp with Docker and Jenkins"
git remote add origin https://github.com/atulkamble/git-docker-jenkins-project.git
git push -u origin main
```

### Clone Repository

```bash
git clone https://github.com/atulkamble/git-docker-jenkins-project.git
cd git-docker-jenkins-project
```

## Jenkins Pipeline Setup

### Prerequisites

1. **Jenkins Server** with Docker installed
````markdown
# Basic Webapp

A minimal Express server with static frontend, Docker support, and Jenkins CI/CD pipeline.

## Quick Start (Local)

```bash
npm install
npm start
```

Open http://localhost:3000

## Docker Quick Start

### Build and Run with Docker

```bash
docker build -t kunalb96/basic-webapp:latest .
docker run -d -p 3000:3000 --name basic-webapp kunalb96/basic-webapp:latest
```

### Using Docker Compose

```bash
docker-compose up -d
docker-compose logs -f
docker-compose down
```

## Git Setup

### Initialize and Push to GitHub

```bash
git add .
git commit -m "Initial commit: Basic webapp with Docker and Jenkins"
git remote add origin https://github.com/KunalB96/Git_Docker_Jenkins_project.git
git push -u origin main
```

### Clone Repository

```bash
git clone https://github.com/KunalB96/Git_Docker_Jenkins_project.git
cd Git_Docker_Jenkins_project
```

## Jenkins Pipeline Setup

### Prerequisites

1. **Jenkins Server** with Docker installed
2. **Jenkins Plugins**:
   - Docker Pipeline
   - Git Plugin
   - Pipeline Plugin

### Configure Jenkins

1. **Add Docker Hub Credentials**:
   - Go to: `Jenkins → Manage Jenkins → Credentials`
   - Add new credentials with ID: `docker_credentials`
   - Username: `kunalb96`
   - Password: Your Docker Hub access token

2. **Create Pipeline Job**:
   - New Item → Pipeline
   - Configure → Pipeline Definition: `Pipeline script from SCM`
   - SCM: Git
   - Repository URL: `https://github.com/KunalB96/Git_Docker_Jenkins_project.git`
   - Branch: `main`
   - Script Path: `Jenkinsfile`

3. **Run Pipeline**:
   - Click "Build Now"
   - Monitor stages: Checkout → Build → Test → Push → Deploy → Health Check

### Pipeline Stages

- **Checkout**: Clone code from GitHub
- **Build**: Build Docker image with tag
- **Test**: Run container and test API endpoint
- **Push to Docker Hub**: Push image to `kunalb96/basic-webapp`
- **Deploy**: Stop old container and deploy new one
- **Health Check**: Verify application is running

## Project Structure

```
.
├── index.js              # Express server
├── public/
│   ├── index.html        # Frontend HTML
│   └── style.css         # Styles
├── package.json          # Node dependencies
├── Dockerfile            # Multi-stage Docker build
├── docker-compose.yml    # Docker Compose config
├── Jenkinsfile           # Jenkins pipeline
├── .dockerignore         # Docker ignore rules
└── .gitignore            # Git ignore rules
```

## API Endpoints

- `GET /` - Serves static frontend
- `GET /api/hello` - Returns JSON: `{"message": "Hello from the basic webapp!", "time": "..."}`

## Environment Variables

- `PORT` - Server port (default: 3000)
- `NODE_ENV` - Environment (production/development)

## Docker Hub

Image: [kunalb96/basic-webapp](https://hub.docker.com/r/kunalb96/basic-webapp)

```bash
docker pull kunalb96/basic-webapp:latest
docker run -p 3000:3000 kunalb96/basic-webapp:latest
```

## GitHub Repository

Repo: [KunalB96/Git_Docker_Jenkins_project](https://github.com/KunalB96/Git_Docker_Jenkins_project)

## Development

```bash
npm install
npm run dev  # Uses nodemon for auto-reload
```

## License

MIT

````

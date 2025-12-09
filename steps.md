```


1. create jenkins server 

git clone https://github.com/atulkamble/ec2-jenkins.git
cd ec2-jenkins 

terraform init 
terraform plan 
terraform apply -auto-approve

plugins - docker, docker pieline, blue oean 

2.

fork repo https://github.com/atulkamble/git-docker-jenkins-project.git

https://github.com/user-name/git-docker-jenkins-project.git

3.

create pipeline 

git repo https://github.com/user-name/git-docker-jenkins-project.git

path - Jenkinsfile 
branch - main 

4. 
git - crededentials - username and token 
docker - credentials - username and token (dockerhub-credentials)

5. run pipeline 
```

# Tooling  

## Host Operating System Details ##  
Operating System: Ubuntu 22.04.2 LTS  
Chipset: Intel(R) Core(TM) i9-9900K CPU (x86_64)  
Ubuntu OS Details: Ubuntu 22.04.2 LTS (Jammy), 64-bit x86  
Installation Type: Normal Installation
  
## Software Used ##  
Container Engine: Docker  
Docker binary: docker-ce, Version 5:24.0.4-1~ubuntu.22.04~jammy  
  
Container Deployment: Docker Compose  
Docker-compose binary: docker-compose, Version: 1.29.2-1  
  
## Dependencies ## 
ca-certificates, Version 20230311ubuntu0.22.04.1  
curl, Version 7.81.0-1ubuntu1.10  
containerd.io, Version 1.6.21-1  
docker-ce, Version 5:24.0.4-1\~ubuntu.22.04\~jammy  
docker-ce-cli, Version 5:24.0.4-1\~ubuntu.22.04\~jammy  
docker-buildx-plugin, Version 0.11.1-1\~ubuntu.22.04\~jammy  
docker-compose, Version: 1.29.2-1  
docker-compose-plugin, Version 2.19.1-1\~ubuntu.22.04\~jammy  
docker-ce-rootless-extras, Version 5:24.0.4-1\~ubuntu.22.04\~jammy  
git, Version 1:2.34.1-1ubuntu1.9  
git-man, Version 1:2.34.1-1ubuntu1.9  
gnupg, Version 2.2.27-3ubuntu2.1  
jq, Version 1.6-2.1ubuntu3  
liberror-perl, Version 0.17029-1  
libslirp0, Version 4.6.1-1build1  
openjdk-17-jdk, Version 17.0.7+7\~us1-0ubuntu1\~22.04.2  
pigz, Version 2.6-1  
slirp4netns, Version 1.0.1-2  

# Step-by-Step Instructions  
## Step 1. Setup Ubuntu Environment and Install Dependencies ##
Execute the following commands in a terminal window:  

sudo apt-get upgrade  
sudo apt-get update  
sudo apt-get install ca-certificates curl git gnupg  

sudo install -m 0755 -d /etc/apt/keyrings  
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg  
sudo chmod a+r /etc/apt/keyrings/docker.gpg  

echo \  
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \  
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \  
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null  
  
sudo apt-get update   
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose docker-compose-plugin jq liberror-perl libslirp0 pigz slirp4netns openjdk-17-jdk  
  
## Step 2. Build, Test, Install, and Execute PetClinic App ##
Execute the following commands in a terminal window:  

unzip 17646-D6-assignment2.zip  
--OR--  
git clone https://github.com/aneumann-cmu/17646-D6-assignment2.git  
  
cd 17646-D6-assignment2  
sudo ./devops-pl.sh  

## Step 3. Open and View Jenkins Pipeline ##
The Jenkins CI job may be viewed in Jenkins by opening Firefox and going to http://localhost:8080

## Step 4. Open and View Sonarqube Analysis ##
The Sonarqube SAST may be viewed in Sonarqube by opening Firefox and going to http://localhost:9000 and using Username: admin and Password: password to login

## Step 5. Open and View PetClinic App ##
The PetClinic App may be viewed by opening Firefox and going to http://localhost:8085  

# Provisioning Scripts & Automated Shell Script
devops-pl.sh, docker-compose.yml, jenkins_config/Dockerfile, jenkins_config/plugins.txt, jenkins_config/casc.yaml, pc_config/Dockerfile, pc_service.sh

# Ansible Playbooks & Job XML
ansible_config/generate_ssh_keys.yaml, ansible_config/generate_authorized_keys.yaml, ansible_config/inventory.yaml, jenkins_config/deploy_jenkins.yaml, configure_jenkins.yaml,
pc_deploy/pc_deploy.yaml, sonar_config/deploy_sonarqube.yaml, jenkins_config/pc_job.xml

# Screenshot of Petclinic Welcome Screen
screenshots/19. PETCLINIC_WELCOME.png

# Journal  
The most challenging part of this assignment was setting up the SSH keys and deploying them on each host using automation. In the end, I accomplished this using a shared docker volume so that the containers could post/copy their ssh keys to/from a shared repository. This likely would have been much easier to implement with some sort of token vault, but similarly to the last project, it would have required much more setup that was outside of the scope of an MVP. 

# Text Capture
Relevant CLI Screenshots  1.0 EXECUTE_DEVOPS_SCRIPT.png, 2.0 CONTAINER_BUILD.png, 3.0 ANSIBLE_CONFIG_DEPLOY.png, 4.0 PC_BUILD_IN_PROGRESS.png, 6.1 PC_BUILD_COMPLETE.png, 9.0 PETCLINIC_WELCOME.png

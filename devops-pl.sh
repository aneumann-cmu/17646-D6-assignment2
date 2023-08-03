#!/bin/bash

# Function to download .jar files from artifacts
download_jar_file() {
  curl "$JENKINS_URL/job/$JOB_NAME/lastSuccessfulBuild/artifact/target/spring-petclinic-3.1.0-SNAPSHOT.jar" -o "spring-petclinic-3.1.0-SNAPSHOT.jar"
}

# Setup Jenkins/SonarQube/PostGRE containers
echo "Setting up container environment"
docker-compose up -d
docker exec jenkins /usr/sbin/sshd
docker exec jenkins ansible-playbook /root/ansible_config/generate_ssh_keys.yaml
docker exec pcapp ansible-playbook /root/ansible_config/generate_ssh_keys.yaml
docker exec pcapp ansible-playbook /root/ansible_config/generate_authorized_keys.yaml
docker exec jenkins ansible-playbook /root/ansible_config/generate_authorized_keys.yaml
docker exec jenkins ansible-playbook /var/jenkins_home/sonar_config/deploy_sonarqube.yaml -u jenkins
docker exec jenkins ansible-playbook /var/jenkins_home/jenkins_config/configure_jenkins.yaml -u jenkins
docker exec jenkins ansible-playbook /var/jenkins_home/jenkins_config/deploy_jenkins.yaml -u jenkins
docker exec jenkins ansible-playbook /var/jenkins_home/jenkins_config/pc_build.yaml -u jenkins

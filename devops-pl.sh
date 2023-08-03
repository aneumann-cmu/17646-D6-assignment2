#!/bin/bash

# Function to download .jar files from artifacts
download_jar_file() {
  curl "$JENKINS_URL/job/$JOB_NAME/lastSuccessfulBuild/artifact/target/spring-petclinic-3.1.0-SNAPSHOT.jar" -o "spring-petclinic-3.1.0-SNAPSHOT.jar"
}

# Setup Jenkins/SonarQube/PostGRE containers
echo "Setting up container environment"
docker-compose up -d

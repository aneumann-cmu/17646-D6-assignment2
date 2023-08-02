FROM jenkins/jenkins:jdk17

# Install Jenkins Plugins
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN jenkins-plugin-cli --plugin-file /usr/share/jenkins/ref/plugins.txt

# Install Ansible
USER root
RUN apt-get update -y && apt-get install -y ansible
RUN 

USER jenkins
FROM jenkins/jenkins:jdk17

# Install Jenkins Plugins
COPY ./jenkins_config/plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN jenkins-plugin-cli --plugin-file /usr/share/jenkins/ref/plugins.txt

# Install Ansible
USER root
RUN apt-get update -y && apt-get install -y ansible python3-pip
RUN pip3 install python-jenkins
RUN ansible-galaxy collection install community.general
#RUN ansible-playbook /home/jenkins_home/deploy_sonarqube.yaml -u jenkins
#RUN ansible-playbook /home/jenkins_home/configure_jenkins.yaml -u jenkins
#RUN ansible-playbook /home/jenkins_home/deploy_jenkins.yaml -u jenkins
#RUN ansible-playbook /home/jenkins_home/pc_build.yaml -u jenkins

USER jenkins

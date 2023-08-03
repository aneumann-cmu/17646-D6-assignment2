FROM jenkins/jenkins:jdk17

USER root

# Install Jenkins Plugins/CASC
COPY ./jenkins_config/plugins.txt /usr/share/jenkins/ref/plugins.txt
COPY ./jenkins_config/casc.yaml /var/jenkins_home/casc.yaml
RUN jenkins-plugin-cli --plugin-file /usr/share/jenkins/ref/plugins.txt

# Install/Configure SSH
RUN apt-get update -y && apt-get install -y openssh-server openssh-client
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN mkdir /run/sshd
RUN chmod 755 /run/sshd

# Install Ansible
RUN apt-get update -y && apt-get install -y ansible python3-pip
RUN pip3 install python-jenkins
RUN ansible-galaxy collection install community.general
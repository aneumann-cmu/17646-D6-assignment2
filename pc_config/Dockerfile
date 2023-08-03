FROM ubuntu:jammy

USER root

# Install Ansible and JDK
RUN apt-get update -y && apt-get install -y ansible curl openjdk-17-jdk
RUN useradd -ms /bin/bash pcapp

#Add Inventory
COPY ./ansible_config/generate_ssh_keys.yaml /home/pcapp/generate_ssh_keys.yaml

# Install/Configure SSH
RUN apt-get update -y && apt-get install -y openssh-server openssh-client
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN mkdir /run/sshd
RUN chmod 755 /run/sshd

# Keep the container running and wait for further commands
CMD ["/usr/sbin/sshd", "-D"]

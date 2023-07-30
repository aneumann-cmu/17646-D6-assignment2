#!/bin/bash
echo "Adding apt-keys"
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null

echo "Updating apt-get"
sudo apt-get -qq update

echo "Installing default-java"
sudo apt-get -y install default-jre > /dev/null 2>&1
sudo apt-get -y install default-jdk > /dev/null 2>&1

echo "Installing git"
sudo apt-get -y install git > /dev/null 2>&1

echo "Installing git-ftp"
sudo apt-get -y install git-ftp > /dev/null 2>&1

echo "Installing jenkins"
sudo apt-get -y install jenkins > /dev/null 2>&1


# Install the Configuration as Code plugin
sudo mkdir -p /var/lib/jenkins/jenkins-casc
sudo chown -R jenkins:jenkins /var/lib/jenkins/jenkins-casc
sudo chmod -R 755 /var/lib/jenkins/jenkins-casc
sudo mkdir -p /var/lib/jenkins/plugins
sudo chown -R jenkins:jenkins /var/lib/jenkins/plugins
sudo chmod -R 755 /var/lib/jenkins/plugins
sudo cp /vagrant/jenkins/casc.yaml /var/lib/jenkins/jenkins-casc/casc.yaml
sudo cp /vagrant/jenkins/plugins.txt /var/lib/jenkins/plugins.txt

sleep 1m



# Create the drop-in snippet file for Jenkins service
export CASC_JENKINS_CONFIG="/var/lib/jenkins/jenkins-casc/casc.yaml"

# Restart the Jenkins service for the changes to take effect
sudo systemctl start jenkins

echo "Installing Jenkins Plugins"
jenkins-plugin-cli --plugin-file /usr/share/jenkins/ref/plugins.txt

sudo systemctl restart jenkins
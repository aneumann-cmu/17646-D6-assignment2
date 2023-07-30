Vagrant.configure("2") do |config|
    # VM for Jenkins and Ansible
    config.vm.define "jenkins" do |jenkins|
      # Choose the Vagrant box base image (Ubuntu 20.04 in this case)
      jenkins.vm.box = "ubuntu/focal64"
  
      # Forward the ports from the guest machine to the host machine
      jenkins.vm.network "forwarded_port", guest: 8080, host: 8080
  
      # Provision the machine using shell script
      jenkins.vm.provision "shell", inline: <<-SHELL
        # Update package lists
        sudo apt update
  
        # Install necessary dependencies
        sudo apt install -y openjdk-11-jdk
  
        # Install Jenkins
        wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
        sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
        sudo apt update
        sudo apt install -y jenkins
  
        # Install Ansible
        sudo apt install -y ansible
  
        # Enable passwordless sudo for the vagrant user
        echo "vagrant ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/vagrant
      SHELL
    end
  
    # VM for SonarQube
    config.vm.define "sonarqube" do |sonarqube|
      # Choose the Vagrant box base image (Ubuntu 20.04 in this case)
      sonarqube.vm.box = "ubuntu/focal64"
  
      # Forward the ports from the guest machine to the host machine
      sonarqube.vm.network "forwarded_port", guest: 9000, host: 9000
  
      # Provision the machine using shell script
      sonarqube.vm.provision "shell", inline: <<-SHELL
        # Update package lists
        sudo apt update
  
        # Install Docker and Docker Compose
        sudo apt install -y docker.io docker-compose
  
        # Enable passwordless sudo for the vagrant user
        echo "vagrant ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/vagrant
  
        # Create a directory for SonarQube data
        sudo mkdir -p /srv/sonarqube/data
  
        # Clone the official SonarQube Docker Compose repository
        git clone https://github.com/SonarSource/docker-sonarqube.git /tmp/docker-sonarqube
  
        # Copy the Docker Compose file and environment variables
        sudo cp /tmp/docker-sonarqube/recipes/official/docker-compose.yml /srv/sonarqube/docker-compose.yml
        sudo cp /tmp/docker-sonarqube/recipes/official/environment /srv/sonarqube/environment
  
        # Start SonarQube with Docker Compose
        cd /srv/sonarqube
        sudo docker-compose up -d
      SHELL
    end
  end
  
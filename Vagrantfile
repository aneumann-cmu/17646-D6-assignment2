Vagrant.configure("2") do |config|
  # Configure the First VM (SonarQube)
  config.vm.define "sonarqube" do |sonarqube|
    sonarqube.vm.box = "ubuntu/focal64"
    sonarqube.vm.hostname = "sonarqube"
    sonarqube.vm.network "forwarded_port", guest: 9000, host: 9000

    # Configure VM resources
    sonarqube.vm.provider "virtualbox" do |vb|
      vb.gui = false
      vb.cpus = 2
      vb.memory = "4096"
    end

    # Install SonarQube
    sonarqube.vm.provision "shell" do |shell|
      shell.inline = "apt-get update && apt-get install -y openjdk-11-jdk sonarqube"
    end
  end

  # Configure the Second VM (Jenkins)
  config.vm.define "jenkins" do |jenkins|
    jenkins.vm.box = "ubuntu/focal64"
    jenkins.vm.hostname = "jenkins"
    jenkins.vm.network "forwarded_port", guest: 8080, host: 8080

    # Configure VM resources
    jenkins.vm.provider "virtualbox" do |vb|
      vb.gui = false
      vb.cpus = 2
      vb.memory = "4096"
    end

    # Install Ansible and Jenkins on the control node (Jenkins VM)
    jenkins.vm.provision "shell" do |shell|
      shell.inline = <<-SHELL
        apt-get update
        curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io.key | gpg --dearmor | sudo tee /usr/share/keyrings/jenkins-archive-keyring.gpg > /dev/null
        echo "deb [signed-by=/usr/share/keyrings/jenkins-archive-keyring.gpg] https://pkg.jenkins.io/debian-stable binary/" | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null
        apt-get update
        apt-get install -y ansible openjdk-17-jdk jenkins
        ansible-galaxy collection install community.general
      SHELL
    end

    # Copy the Ansible playbook and required files from the host to the control node (Jenkins VM)
    config.vm.synced_folder ".", "/vagrant", disabled: true
    jenkins.vm.provision "file", source: "deploy_jenkins.yaml", destination: "/home/vagrant/deploy_jenkins.yaml"

    # Deploy Jenkins using the Ansible playbook
    jenkins.vm.provision "shell" do |shell|
      shell.inline = "export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64 && ansible-playbook /home/vagrant/deploy_jenkins.yaml -u vagrant"
    end
  end
end

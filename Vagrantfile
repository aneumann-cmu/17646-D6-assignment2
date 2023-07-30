Vagrant.configure("2") do |config|
  # Configure the first VM (Jenkins)
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

    # Install Jenkins
    jenkins.vm.provision "shell" do |shell|
      shell.path = "jenkins.sh"
    end
  end

  # Configure the second VM (SonarQube)
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
      shell.inline = "apt-get update && apt-get install -y sonarqube"
    end
  end
end

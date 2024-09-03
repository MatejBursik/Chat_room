# Vagrantfile for hosting a MySQL database and running a Java application on Alpine
Vagrant.configure("2") do |config|

    # Use Alpine Linux as the base box
    #config.vm.box = "generic/alpine319"
    #config.vm.box = "ubuntu/focal64"
    config.vm.box = "generic/ubuntu2204"
  
    # Set the provider to VirtualBox
    config.vm.provider "virtualbox" do |vb|
        vb.memory = "2048" # Set dedicated memory size
        vb.cpus = 2        # Set dedicated number of CPU cores
    end
  
    # Set up the VM hostname
    config.vm.hostname = "java-mysql-server"

    # Set up Login credentials
    #config.ssh.username = 'root'
    #config.ssh.password = 'vagrant'
  
    # Network: forward ports 3306 (MySQL) and 8080 (Java app) to host machine
    config.vm.network "forwarded_port", guest: 3306, host: 3306
    config.vm.network "forwarded_port", guest: 8080, host: 8080
    
    # Sync the directory containing the initial SQL file to the VM
    config.vm.synced_folder "./database", "/home/vagrant/database"

    # Sync the directory containing Java application to the VM
    config.vm.synced_folder "./app", "/home/vagrant/app"
  
    # Run provision code to update and install distribution packages
    config.vm.provision "shell", inline: <<-SHELL
        sudo apt-get update
        sudo apt-get install -y mysql-server openjdk-17-jdk maven

        # Export environment variables for Java and Maven
        echo 'export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64' >> /home/vagrant/.profile
        echo 'export PATH=$JAVA_HOME/bin:$PATH' >> /home/vagrant/.profile
        echo 'export MAVEN_HOME=/usr/share/maven' >> /home/vagrant/.profile
        echo 'export PATH=$MAVEN_HOME/bin:$PATH' >> /home/vagrant/.profile
        source /home/vagrant/.profile
    SHELL

    # Run provision scripts to install and run everything for deployment
    config.vm.provision "shell", path: "mysql.sh", name: "mysql"
    config.vm.provision "shell", path: "java.sh", name: "java"
  end
# Vagrantfile for hosting a MySQL database and running a Java application on Alpine
Vagrant.configure("2") do |config|

    # Use Alpine Linux as the base box
    config.vm.box = "generic/alpine38"
  
    # Set the provider to VirtualBox
    config.vm.provider "virtualbox" do |vb|
        vb.memory = "2048" # Set dedicated memory size
        vb.cpus = 2        # Set dedicated number of CPU cores
    end
  
    # Set up the VM hostname
    config.vm.hostname = "java-mysql-server"

    # Set up Login credentials
    config.ssh.username = 'root'
    config.ssh.password = 'vagrant'
  
    # Network: forward ports 3306 (MySQL) and 8080 (Java app) to host machine
    config.vm.network "forwarded_port", guest: 3306, host: 3306
    config.vm.network "forwarded_port", guest: 8080, host: 8080
    
    # Sync the directory containing the initial SQL file to the VM
    config.vm.synced_folder "./database", "/home/vagrant/database"

    # Sync the directory containing Java application to the VM
    config.vm.synced_folder "./app", "/home/vagrant/app"
  
    # Run provision code to update distribution packages
    config.vm.provision "shell", inline: <<-SHELL
        sudo apk update
    SHELL

    # Run provision scripts to install and run everything for deployment
    config.vm.provision "shell", path: "mysql.sh", name: "mysql"
    config.vm.provision "shell", path: "java.sh", name: "java"
  end
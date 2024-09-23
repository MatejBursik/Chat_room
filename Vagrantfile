# Vagrantfile for running a Java application and hosting a MySQL database with a Nginx reverse-proxy server
Vagrant.configure("2") do |config|

    # DB vm
    config.vm.define "db" do |db|
        db.vm.hostname = "db"

        # Use Ubuntu Linux as the base box
        db.vm.box = "ubuntu/jammy64"

        # Network setting
        db.vm.network "private_network", type: "dhcp"

        # Sync the directory containing the initial SQL file to the VM
        db.vm.synced_folder "./database", "/home/vagrant/database"

        db.vm.provider "virtualbox" do |vb|
            vb.memory = "1024" # Set dedicated memory size
            vb.cpus = 1        # Set dedicated number of CPU cores
        end

        # Run provision scripts to install and run everything for deployment
        db.vm.provision "shell", path: "mysql.sh", name: "mysql"
    end

    # WEB vm
    config.vm.define "web" do |web|
        web.vm.hostname = "web"

        # Use Ubuntu Linux as the base box
        web.vm.box = "ubuntu/jammy64"

        # Network setting
        web.vm.network "private_network", type: "dhcp"
        web.vm.network "forwarded_port", guest: 8080, host: 8080

        web.vm.provider "virtualbox" do |vb|
            vb.memory = "1024" # Set dedicated memory size
            vb.cpus = 1        # Set dedicated number of CPU cores
        end

        # Sync the directory containing Java application to the VM
        web.vm.synced_folder "./app", "/home/vagrant/app"

        # Run provision code to update and install distribution packages
        web.vm.provision "shell", inline: <<-SHELL
            sudo apt-get update
            sudo apt-get install -y openjdk-17-jdk maven tree

            # Export environment variables for Java and Maven
            export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
            export PATH=$JAVA_HOME/bin:$PATH
            export MAVEN_HOME=/usr/share/maven
            export PATH=$MAVEN_HOME/bin:$PATH
        SHELL

        # Run provision scripts to install and run everything for deployment
        web.vm.provision "shell", path: "java.sh", name: "java"
    end
end

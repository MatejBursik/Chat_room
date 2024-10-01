# Vagrantfile for running a Java application and hosting a MySQL database with a Nginx reverse-proxy server
Vagrant.configure("2") do |config|

    # DB vm
    config.vm.define "db" do |db|
        db.vm.hostname = "db"

        # Use Ubuntu Linux as the base box
        db.vm.box = "ubuntu/jammy64"

        # Network setting
        db.vm.network "forwarded_port", guest: 3306, host: 3306

        db.vm.provider "virtualbox" do |vb|
            vb.memory = "1024" # Set dedicated memory size
            vb.cpus = 1        # Set dedicated number of CPU cores
        end

        # Sync the directory containing the initial SQL file to the VM
        db.vm.synced_folder "./database", "/home/vagrant/database"

        # Run provision scripts to install
        db.vm.provision "shell", inline: <<-SHELL
            sudo apt-get update
            sudo apt-get install -y mysql-server
            echo "#ship-external-locking" | sudo tee -a /etc/mysql/my.cnf > /dev/null
            echo "#bind-address = 0.0.0.0" | sudo tee -a /etc/mysql/my.cnf > /dev/null
        SHELL

        # Start the MySQL service
        db.vm.provision "shell", path: "mysql.sh", name: "mysql", run: "always"

        # Run provision scripts to update permissions and run init files
        db.vm.provision "shell", inline: <<-SHELL
            # Set root password and apply security settings
            sudo mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH 'mysql_native_password' BY 'rootpassword';"

            # Run the SQL file to create initial tables
            sudo mysql -u root -prootpassword < /home/vagrant/database/db_init.sql

            # Optional: Run the SQL file to add initial data
            sudo mysql -u root -prootpassword < /home/vagrant/database/data_init.sql
        SHELL
    end

    # API vm
    config.vm.define "api" do |api|
        api.vm.hostname = "api"

        # Use Ubuntu Linux as the base box
        api.vm.box = "ubuntu/jammy64"

        # Network setting
        api.vm.network "forwarded_port", guest: 8080, host: 8085

        api.vm.provider "virtualbox" do |vb|
            vb.memory = "1024" # Set dedicated memory size
            vb.cpus = 1        # Set dedicated number of CPU cores
        end

        # Sync the directory containing Java application to the VM
        api.vm.synced_folder "./app/chat_room_api", "/home/vagrant/app"

        # Run provision code to update and install distribution packages
        api.vm.provision "shell", inline: <<-SHELL
            sudo apt-get update
            sudo apt-get install -y openjdk-17-jdk maven tree

            # Export environment variables for Java and Maven
            export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
            export PATH=$JAVA_HOME/bin:$PATH
            export MAVEN_HOME=/usr/share/maven
            export PATH=$MAVEN_HOME/bin:$PATH
        SHELL

        # Run provision scripts to update the db ip in application.properties
        #api.vm.provision "shell", path: "db_ip.sh", name: "db_ip", env: {"DB_IP" => "10.0.0.36"}, run: "always"

        # Run provision scripts to install and run everything for deployment
        api.vm.provision "shell", path: "api.sh", name: "api", run: "always"
    end

    # WEB vm
    config.vm.define "web" do |web|
        web.vm.hostname = "web"

        # Use Ubuntu Linux as the base box
        web.vm.box = "ubuntu/jammy64"

        # Network setting
        web.vm.network "forwarded_port", guest: 8080, host: 8080

        web.vm.provider "virtualbox" do |vb|
            vb.memory = "1024" # Set dedicated memory size
            vb.cpus = 1        # Set dedicated number of CPU cores
        end

        # Sync the directory containing Java application to the VM
        web.vm.synced_folder "./app/chat_room_web", "/home/vagrant/app"

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
        web.vm.provision "shell", path: "web.sh", name: "web", run: "always"
    end
end

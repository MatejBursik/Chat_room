#!/bin/bash

# Change to the Java application directory
cd /home/vagrant/app/demo

# Compile the application
mvn clean package

# Run the Java application
java -jar target/demo-0.0.1-SNAPSHOT.jar # Demo app

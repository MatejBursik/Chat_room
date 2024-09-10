#!/bin/bash

# Change to the Java application directory
cd /home/vagrant/app/chatroom

# Compile the application
mvn clean package

# Run the Java application
java -jar target/chatroom-0.0.1-SNAPSHOT.jar

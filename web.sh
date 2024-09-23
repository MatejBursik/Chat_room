#!/bin/bash

# Change to the Java application directory
cd /home/vagrant/app

# Compile the application
mvn clean package

# Run the Java application in the background
# redirects standard error and standard output to the same file
java -jar target/chat_room-0.0.1-SNAPSHOT.jar > output.log 2>&1 &

#!/bin/bash

# Change to the Java application directory
cd /home/vagrant/app/test

# Compile the application
mvn clean install

# Run the Java application
java -jar target/Test.jar # Test app

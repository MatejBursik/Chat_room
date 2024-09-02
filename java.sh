#!/bin/bash

# Install open-source implementation of the Java
sudo apk add openjdk11

# Change to the Java application directory
cd /home/vagrant/app

# Compile and run the Java application
javac MyApp.java
java MyApp &

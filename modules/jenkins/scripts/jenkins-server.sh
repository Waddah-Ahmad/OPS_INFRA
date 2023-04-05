#!/bin/bash

# Update the package list and install Java
sudo apt-get update
sudo apt-get install -y default-jdk

# Download and install Jenkins
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
echo deb https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list
sudo apt-get update
sudo apt-get install -y jenkins

# Update the Jenkins admin password
echo "jenkins.model.Jenkins.instance.securityRealm.createAccount(\"admin\", \"waddah\")" | sudo java -jar /usr/share/java/jenkins.war --auth-user=admin --auth-password=$(sudo cat /var/lib/jenkins/secrets/initialAdminPassword) --jenkins.install.runSetupWizard=false --httpPort=8080 -

# Install plugins
sudo mkdir -p /var/lib/jenkins/plugins
sudo chown jenkins:jenkins /var/lib/jenkins/plugins
sudo wget -O /var/lib/jenkins/plugins/git.hpi https://updates.jenkins-ci.org/download/plugins/git/latest/git.hpi
sudo wget -O /var/lib/jenkins/plugins/ssh.hpi https://updates.jenkins-ci.org/download/plugins/ssh/latest/ssh.hpi
sudo systemctl restart jenkins

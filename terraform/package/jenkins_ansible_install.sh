#! /bin/bash

## Jenkins Installation ##
sudo yum -y update
sudo wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo

sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
sudo yum upgrade
sudo yum install jenkins java-1.8.0-openjdk-devel -y
sudo systemctl daemon-reload
sudo systemctl start jenkins
sudo systemctl enable jenkins
sudo ss -tunelp | grep 8080
IP=$(hostname -I)
echo "Jenkins: http://${IP}:8080 "

## Ansible Installation ##
sudo wget https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
sudo yum -y install epel-release-latest-7.noarch.rpm
sudo yum update -y
sudo yum install python python-devel python-pip openssl ansible -y
ansible --version

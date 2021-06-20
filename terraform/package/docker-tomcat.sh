#! /bin/bash

## Tomcat Installation ##

 sudo amazon-linux-extras install -y tomcat8.5
 sudo systemctl start tomcat.service
 sudo systemctl enable tomcat.service


 ## Docker Installation ##
 sudo amazon-linux-extras install -y docker
 sudo service docker start
 sudo usermod -a -G docker ec2-user
 sudo chkconfig docker on

## Docker Compose Installation ##
sudo curl -L https://github.com/docker/compose/releases/download/1.22.0/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose version


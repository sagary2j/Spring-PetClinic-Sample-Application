# Spring PetClinic Sample Application
## Understanding the Spring Petclinic application with a few diagrams
<a href="https://speakerdeck.com/michaelisvy/spring-petclinic-sample-application">See the presentation here</a>

## Running petclinic locally
Petclinic is a [Spring Boot](https://spring.io/guides/gs/spring-boot) application built using [Maven](https://spring.io/guides/gs/maven/). You can build a jar file and run it from the command line:

```
git clone https://github.com/spring-projects/spring-petclinic.git
cd spring-petclinic
./mvnw package
java -jar target/*.jar
```
## Terraform Provisioning Lifecycle
This project will create a VCP with Internet Gateway, subnets accross 2 AZs: one public subnet and one one private subnet with respective ec2 vm's.
An SSH key pair is dynamically generated as well, and the private key is copied over to the public subnet host.

The ec2 instance in the public subnet is assigned a security group with access from the the intenret via port 22 (for ssh), Jenkins(8080).

The ec2 instance in the private subnet is assigned to a security group that only allows ssh access only from connections in the public subnet.

Both security groups are dynamically created in the network module.

```
terraform init
terraform plan
terraform apply --auto-approve=true
terraform destroy
```

variable "environment" {
  description = "The Deployment environment"
  default = "dev"
}

variable "user_data_file_pub" {
  default = "jenkins_ansible_install.sh"
}

variable "user_data_file_pvt" {
  default = "docker-tomcat.sh"
}

variable "key_name" {
  
}

variable "sg_priv_id" {
  
}

variable "sg_pub_id" {
  
}

variable "subnet_id_pub" {
  
}

variable "subnet_id_pvt" {
  
}
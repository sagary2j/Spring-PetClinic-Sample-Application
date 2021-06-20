variable "region" {
  description = "The AWS Deployment region"
  default = "us-east-1"
}

variable "environment" {
  default = "dev"
}

//Networking
variable "vpc_cidr" {
  description = "The CIDR block of the vpc"
}

variable "public_subnets_cidr" {
  type        = list
  description = "The CIDR block for the public subnet"
}

variable "private_subnets_cidr" {
  type        = list
  description = "The CIDR block for the private subnet"
}

variable "availability_zones" {
  type        = list
  description = "The az that the resources will be launched"
}
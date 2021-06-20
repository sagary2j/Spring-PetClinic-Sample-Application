locals {
  availability_zones = ["${var.region}a", "${var.region}b"]
}

module "ssh-key" {
  source    = "./modules/ssh-key"
  environment = var.environment
}

module "networking" {
  source = "./modules/networking"
  #region               = "${var.region}"
  environment          = "${var.environment}"
  vpc_cidr             = "${var.vpc_cidr}"
  public_subnets_cidr  = "${var.public_subnets_cidr}"
  private_subnets_cidr = "${var.private_subnets_cidr}"
  availability_zones   = "${local.availability_zones}"

}

module "ec2" {
    source = "./modules/ec2"
    subnet_id_pub = module.networking.public_subnet_id
    subnet_id_pvt = module.networking.private_subnet_id
    sg_pub_id  = module.networking.sg_pub_id
    sg_priv_id = module.networking.sg_priv_id
    key_name = module.ssh-key.key_name
    user_data_file_pub = "package/jenkins_ansible_install.sh"
    user_data_file_pvt = "package/docker-tomcat.sh"
}

# module "ec2-CD" {
#     source = "./modules/ec2-vm"
#     subnet_id = "${module.networking.private_subnet_id}"
#     aws_security_group = "${module.networking.aws_security_group}"
#     user_data_file = "package/docker-tomcat.sh"
# }


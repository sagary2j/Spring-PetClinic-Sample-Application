data "aws_ami" "amazon-linux-2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

resource "aws_instance" "ec2_public" {
	 ami  = data.aws_ami.amazon-linux-2.id   
	#ami = "ami-0aeeebd8d2ab47354"
	associate_public_ip_address = true
	instance_type = "t2.micro"
	key_name = var.key_name
	user_data = "${file(var.user_data_file_pub)}"
    vpc_security_group_ids = [var.sg_pub_id]
    subnet_id = var.subnet_id_pub[0]
	tags = {
		Name = "${var.environment}-EC2-PUBLIC"	
	}
  provisioner "file" {
    source      = "./${var.key_name}.pem"
    destination = "/home/ec2-user/${var.key_name}.pem"

    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file("${var.key_name}.pem")
      host        = self.public_ip
    }
  }
  
  //chmod key 400 on EC2 instance
  provisioner "remote-exec" {
    inline = ["chmod 400 ~/${var.key_name}.pem"]

    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file("${var.key_name}.pem")
      host        = self.public_ip
    }

  }

}

resource "aws_instance" "ec2_private" {
  ami                         = data.aws_ami.amazon-linux-2.id
  associate_public_ip_address = false
  instance_type               = "t2.micro"
  key_name                    = var.key_name
  user_data = "${file(var.user_data_file_pvt)}"
  subnet_id                   = var.subnet_id_pvt[0]
  vpc_security_group_ids      = [var.sg_priv_id]

  tags = {
    "Name" = "${var.environment}-EC2-PRIVATE"
  }

}

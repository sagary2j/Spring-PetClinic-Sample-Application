output "vpc_id" {
  value = "${aws_vpc.vpc.id}"
}   

output "public_subnet_id" {
  #value = "${aws_subnet.public_subnet.*.id}"
  value = flatten(aws_subnet.public_subnet.*.id)
}   

output "private_subnet_id" {
  value = "${aws_subnet.private_subnet.*.id}"
}   

output "sg_pub_id" {
  value = aws_security_group.allow_ssh_pub.id
}

output "sg_priv_id" {
  value = aws_security_group.allow_ssh_priv.id
}

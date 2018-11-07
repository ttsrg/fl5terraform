provider "aws" {
  shared_credentials_file = "~/.aws/creds"
  region     = "eu-west-1"
#  profile = "calc-web"
}


## Define ssh_keys for instance

resource "aws_key_pair" "calcservers" {
#  key_name    = "${lower(var.name)}-key_pair-${lower(var.environment)}"
  key_name    = "key_pair_${var.name}_${var.environment}"
  public_key  = "${file("${var.ssh_key_path}")}"
}


# Create a web serverS
resource "aws_instance" "servers" {
count = "${length(var.domains)}"
  ami = "ami-00035f41c82244dab"
#  associate_public_ip_address = true
  instance_type = "t2.micro"
  key_name = "${aws_key_pair.calcservers.key_name}"
  security_groups = ["${aws_security_group.calc_all.name}"]
  tags {
    Name = "ttserg EC2 ${element(var.domains, count.index)}"
  }
}


#output "web.ip" {
#    value = "${aws_instance.web.public_ip}"
#}


#output "api.ip" {
#    value = "${aws_instance.api.public_ip}"
#}


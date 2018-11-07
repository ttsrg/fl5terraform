provider "aws" {
  shared_credentials_file = "~/.aws/creds"
#  shared_credentials_file = "${pathexpand("~/.aws/credentials")}"
  region     = "us-east-1"
}

## Define ssh_keys for instance

resource "aws_key_pair" "key_pair" {
#  key_name    = "${lower(var.name)}-key_pair-${lower(var.environment)}"
  public_key  = "${file("${var.ssh_key_path}")}"
}


# Create a web serverS
resource "aws_instance" "servers" {
count = "${length(var.domains)}"
  ami = "ami-00035f41c82244dab"
#  associate_public_ip_address = true
  instance_type = "t2.micro"
#  key_name = "ttserg"
  tags {
    Name = "ttserg EC2 pc${element(var.domains, count.index)}"
  }
}


#output "web.ip" {
#    value = "${aws_instance.web.public_ip}"
#}


#output "api.ip" {
#    value = "${aws_instance.api.public_ip}"
#}


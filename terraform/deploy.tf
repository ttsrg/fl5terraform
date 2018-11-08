

resource "local_file" "ansible_inventory" {
    content     = "[calc-web]\n${aws_instance.web.public_ip} \n[calc-api]\n${aws_instance.api.public_ip}"
    filename = "../ansible/inventory/prod"
}

#resource "local_file" "ansible_web_vars" {
#  content   = "---\nssl_certs_domains: [${aws_route53_record.calc_web.name}]\ncalc_web_api_ip: [${aws_instance.api.public_ip}]\n" 
#  filename  = "../ansible/inventory/group_vars/web.yml"
#}


resource "null_resource" "calc_deploy" {
  provisioner "local-exec" {
    command = "ansible-playbook -i ../ansible/inventory/prod ../ansible/calc-web.yml"
  }

  provisioner "local-exec" {
    command = "ansible-playbook -i ../ansible/inventory/prod ../ansible/calc-api.yml"
  }
}


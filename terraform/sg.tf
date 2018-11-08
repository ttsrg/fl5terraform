
resource "aws_security_group" "calc_all" {
    name        = "sg_calc_all"

    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
  ingress {
        from_port   = 443
        to_port     = 443
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
 ingress {
        from_port   = 8080
        to_port     = 8080
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

}


resource "aws_security_group" "calc_web" {
    name        = "sg_calc_web"

    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
  ingress {
        from_port   = 443
        to_port     = 443
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

}



resource "aws_security_group" "calc_api" {
    name        = "sg_calc_api"

    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port   = 8080
        to_port     = 8080
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

}

/*
resource "aws_security_group_rule" "ingress_ports_mgmnt_api" {
    type                = "ingress"
    count               = "${length(var.allowed_mgmnt_ports)}"
    security_group_id   = "${aws_security_group.calc_api.id}"
    from_port           = "${element(var.allowed_mgmnt_ports, count.index)}"
    to_port             = "${element(var.allowed_mgmnt_ports, count.index)}"
    protocol            = "tcp"
    cidr_blocks         = "${var.allowed_mgmnt_address}"
}

resource "aws_security_group_rule" "egress_ports_mgmnt_api" {
    type                = "egress"
    count               = "${length(var.allowed_mgmnt_ports)}"
    security_group_id   = "${aws_security_group.calc_api.id}"
    from_port           = "${element(var.allowed_mgmnt_ports, count.index)}"
    to_port             = "${element(var.allowed_mgmnt_ports, count.index)}"
    protocol            = "tcp"
    cidr_blocks         = "${var.allowed_mgmnt_address}"
}

resource "aws_security_group_rule" "ingress_ports_web" {
    type                = "ingress"
    count               = "${length(var.allowed_ports_web)}"
    security_group_id   = "${aws_security_group.calc_web.id}"
    from_port           = "${element(var.allowed_ports_web, count.index)}"
    to_port             = "${element(var.allowed_ports_web, count.index)}"
    protocol            = "tcp"
    cidr_blocks         = ["0.0.0.0/0"]
}
*/

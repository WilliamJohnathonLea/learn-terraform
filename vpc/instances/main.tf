resource "aws_instance" "base_instance_1" {
  ami                         = "ami-0eb89db7593b5d434" # Ubuntu 18.04 LTS
  instance_type               = "t2.micro"
  subnet_id                   = var.subnet_1_id
  associate_public_ip_address = true
  vpc_security_group_ids = [
    var.public_sg_id
  ]
  key_name = var.key_name

  provisioner "remote-exec" {
    connection {
      type  = "ssh"
      host  = aws_instance.base_instance_1.public_ip
      user  = "ubuntu"
      port  = 22
      private_key = file("~/.ssh/id_rsa")
    }
    script = "files/instance_bootstrap.sh"
  }
}

resource "aws_instance" "base_instance_2" {
  ami                         = "ami-0eb89db7593b5d434" # Ubuntu 18.04 LTS
  instance_type               = "t2.micro"
  subnet_id                   = var.subnet_2_id
  associate_public_ip_address = true
  vpc_security_group_ids = [
    var.public_sg_id
  ]
  key_name = var.key_name

  provisioner "remote-exec" {
    connection {
      type  = "ssh"
      host  = aws_instance.base_instance_2.public_ip
      user  = "ubuntu"
      port  = 22
      private_key = file("~/.ssh/id_rsa")
    }
    script = "files/instance_bootstrap.sh"
  }
}

resource "aws_instance" "base_instance_3" {
  ami                         = "ami-0eb89db7593b5d434" # Ubuntu 18.04 LTS
  instance_type               = "t2.micro"
  subnet_id                   = var.subnet_3_id
  associate_public_ip_address = true
  vpc_security_group_ids = [
    var.public_sg_id
  ]
  key_name = var.key_name

  provisioner "remote-exec" {
    connection {
      type  = "ssh"
      host  = aws_instance.base_instance_3.public_ip
      user  = "ubuntu"
      port  = 22
      private_key = file("~/.ssh/id_rsa")
    }
    script = "files/instance_bootstrap.sh"
  }
}

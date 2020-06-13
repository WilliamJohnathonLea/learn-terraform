resource "aws_instance" "base_instance_1" {
  ami                         = "ami-0eb89db7593b5d434" # Ubuntu 18.04 LTS
  instance_type               = "t2.micro"
  subnet_id                   = var.subnet_1_id
  associate_public_ip_address = true
  vpc_security_group_ids = [
    var.public_sg_id
  ]
  key_name = var.key_name

  provisioner "file" {
    source      = "files/bootstrap.sh"
    destination = "/tmp/bootstrap.sh"
  }

  provisioner "remote-exec" {
    connection {
      type  = "ssh"
      host  = aws_instance.base_instance_1.public_ip
      user  = "ubuntu"
      port  = 22
      private_key = file("~/.ssh/id_rsa")
    }

    inline = [
      "sudo apt-get update",
      "sudo apt-get install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common",
      "curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -",
      "sudo add-apt-repository \"deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable\"",
      "sudo apt-get update",
      "sudo apt-get install -y docker-ce docker-ce-cli containerd.io",
      "sudo usermod -aG docker $USER"
    ]
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

    inline = [
      "sudo apt-get update",
      "sudo apt-get install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common",
      "curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -",
      "sudo add-apt-repository \"deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable\"",
      "sudo apt-get update",
      "sudo apt-get install -y docker-ce docker-ce-cli containerd.io",
      "sudo usermod -aG docker $USER"
    ]
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

    inline = [
      "sudo apt-get update",
      "sudo apt-get install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common",
      "curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -",
      "sudo add-apt-repository \"deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable\"",
      "sudo apt-get update",
      "sudo apt-get install -y docker-ce docker-ce-cli containerd.io",
      "sudo usermod -aG docker $USER"
    ]
  }
}

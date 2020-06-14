resource "aws_instance" "jenkins_master" {
  ami                         = "ami-0eb89db7593b5d434" # Ubuntu 18.04 LTS
  instance_type               = "t2.small"
  subnet_id                   = var.subnet_id
  associate_public_ip_address = true
  vpc_security_group_ids = [
    var.sg_id
  ]
  key_name = var.key_name
  tags = {
    Name = "jenkins-master"
  }

  provisioner "remote-exec" {
    connection {
      type        = "ssh"
      host        = aws_instance.jenkins_master.public_ip
      user        = "ubuntu"
      port        = 22
      private_key = file("~/.ssh/id_rsa")
    }
    script = "files/jenkins_master_bootstrap.sh"
  }

}

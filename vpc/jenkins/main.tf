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

    inline = [
      "sudo apt-get update",
      "sudo apt-get install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common",
      "curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -",
      "sudo add-apt-repository \"deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable\"",
      "sudo apt-get update",
      "sudo apt-get install -y docker-ce docker-ce-cli containerd.io",
      "wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -",
      "sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'",
      "sudo apt-get update",
      "sudo apt-get install -y openjdk-8-jdk",
      "sudo apt-get install -y jenkins",
      "sudo usermod -aG docker $USER",
      "sudo usermod -aG docker jenkins",
      "sudo service jenkins restart"
    ]
  }

}

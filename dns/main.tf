resource "aws_eip" "jenkins_master_public_ip" {
  instance = var.jenkins_master_instance_id
  vpc = true
}

data "aws_route53_zone" "hosted_zone" {
  name = "universauth.com."
}

resource "aws_route53_record" "jenkins_master_record" {
  zone_id = data.aws_route53_zone.hosted_zone.zone_id
  name    = "jenkins.${data.aws_route53_zone.hosted_zone.name}"
  type    = "A"
  ttl     = "300"
  records = [aws_eip.jenkins_master_public_ip.public_ip]
}

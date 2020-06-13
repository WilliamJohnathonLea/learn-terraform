resource "aws_key_pair" "local_kp" {
  key_name = "william-kp"
  public_key = file("~/.ssh/id_rsa.pub")
}
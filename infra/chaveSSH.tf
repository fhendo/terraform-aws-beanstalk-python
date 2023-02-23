resource "aws_key_pair" "chaveSSH" {
  key_name = var.chaveSSH
  public_key = file("${var.chaveSSH}.pub") 
}

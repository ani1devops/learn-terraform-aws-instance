#resource "aws_key_pair" "key-tf" {
#  key_name   = "jenkins-keypair"
#  public_key = file("${path.module}/jenkins-keypair.pem")
#}

resource "aws_instance" "slave" {
  ami           = var.ami_id
  instance_type = var.instance_type
  count         = 2
  #  key_name               = aws_key_pair.key-tf.key_name
  key_name               = "jenkins-keypair"
  vpc_security_group_ids = ["yoursecuritygroup id"]
  subnet_id              = "yoursubnet id"
  tags = {
    Name = "Slave"
  }

}

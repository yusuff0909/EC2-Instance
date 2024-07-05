resource "aws_instance" "server1" {
  ami           = "ami-0eaf7c3456e7b5b68"
  instance_type = "t2.micro"
  security_groups = [aws_security_group.sg-demo.name]
  key_name      = aws_key_pair.aws_key.key_name
  user_data     = file("server-config.sh")
  tags ={
    Name = "Terraform-Server"
  }
}

/*
resource "aws_ebs_volume" "vol1" {
  availability_zone = aws_instance.server1.availability_zone
  size              = 30

  tags = {
    Name = "Dev-Volume"
  }
  
}

resource "aws_volume_attachment" "att1" {
  device_name = "/dev/sdc"
  volume_id   = aws_ebs_volume.vol1.id
  instance_id = aws_instance.server1.id
}


resource "local_file" "file1" {
  filename = "test.txt"
  content = "hello Serge"
}
*/
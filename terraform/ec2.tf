resource "aws_instance" "fergacc_ec2" {
  ami           = "ami-0e83be366243f524a"
  instance_type = "t2.micro"
  key_name = "TestFeyGcc"
  security_groups = [aws_security_group.fergacc_secg.id]
  subnet_id = "subnet-04ce466f"

  tags = {
    Name = "FernandaGarciaInstancia"
  }
}

output "My_ip"{
  value = aws_instance.fergacc_ec2.public_ip
}

resource "aws_security_group" "fergacc_secg" {
  name        = "fergaccsc"
  description = "Permite trafico SSH.HTTP/S"
  vpc_id      = "vpc-c2c3a2a9"

  ingress {
    description      = "SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    description      = "HTTP"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    description      = "HTTPS"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    description      = "Webgoat"
    from_port        = 8080
    to_port          = 8080
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    description      = "WebGoat"
    from_port        = 9090
    to_port          = 9090
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

 egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }


  tags = {
    Name = "FernandaGarciaSC"
  }
}

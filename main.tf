provider "aws" {
    region = var.region
  }
  
  resource "aws_instance" "linux_server" {
    ami                    = var.ami_id
    instance_type          = var.instance_type
    key_name               = var.key_name
    associate_public_ip_address = true
  
    user_data              = file("user_data.sh")
  
    tags = {
      Name = "Harika-Linux-Server"
    }
  
    provisioner "local-exec" {
      command = "echo Instance ${self.public_ip} created!"
    }
  }

  resource "aws_security_group" "allow_ssh" {
    name        = "allow_ssh"
    description = "Allow SSH inbound connections"
    vpc_id = "vpc-016680b94f78d0524"
  
    ingress {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["74.81.110.46/32"]  # Replace with your public IP
    }
  
    egress {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  
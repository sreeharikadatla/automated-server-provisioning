variable "region" {
    default = "us-east-1"
}

variable "instance_type" {
    default = "t2.micro"
}

variable "ami_id" {
    description = "Ubuntu 22.04 AMI"
    default = "ami-084568db4383264d4"
}

variable "key_name" {
    description = "AWS key pair name"
    type = string 
}
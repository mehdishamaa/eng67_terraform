# This is to launch an AMI on AWS
# What do we want to do and where would we like to create instance?

# Syntax for terraform is similar to json - we use { to write block of code}

provider "aws" {

# Which region do we have the AMI available
   region = "eu-west-1"
}

# Create an instance - launch an instance from the AMI
resource "aws_instance" "app_instance" {
          ami          = "ami-0135eaf9586569464"

# What type of ec2 instance do we want to create? - t2micro
          instance_type = "t2.micro"


# Do we want public IP?
             associate_public_ip_address = true
             
             tags = {
                 Name = "eng67.mehd.terraform.ec2"
             }



}

# Create a subnet block of code

resource "aws_subnet" "eng67_mehdi_subnet" {
  vpc_id     = var.vpc_id
  cidr_block = "172.31.138.0/24"

  tags = {
    Name = "Eng67_mehdi_subnet"
  }
}

# Attach this subnet to devopsstudent vpc

resource "aws_security_group" "eng67_daniel_terraform_sg" {
  name        = "eng67_daniel_terraform_sg"
  description = "Allow ingress and egress traffic"
  vpc_id      = "vpc-07e47e9d90d2076da"

  ingress {
    description = "ingress traffic"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["172.31.138.0/24"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }


  tags = {
    Name = "eng67_daniel_terraform_cidr"
  }
}


# Create Ingress (inbound traffic) block of code to allow port 80 and 0.0.0.0/0
# Create Egress (outbound traffic) block of code to allow port 80 

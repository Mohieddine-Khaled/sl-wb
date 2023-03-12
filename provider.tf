provider "aws" {
  # Configuration options
  region     = "us-east-1"
     access_key = “ASIARXVVIWXW34LGJN4V”
  secret_key = “C4Gy/vMu1MlWLd4G7LWw1EyhISTNZyYAmVylOJ7c”
  token = “FwoGZXIvYXdzEOH//////////wEaDJ24AGFygNxLzjJr+yK9ATJlvxeyrGbysO/NEPxxcvpIrS0eL+QQ8r8WuwFyj/MfvY5AOSOmEdDYgr/I8KYfukDSiiXsWDqvHL5xHrFRItbp/qNMCBagFD8SfxFi2SOJVYNXxEDyxuriJw06o0HxNuFZdVk/JWIhDl4774VkcB5h9iVyh1Infan+aQ6Wiqh9opGtIgCLp2CcAOKNe8uScsxGm7b9+zeD2tH1dSpjJQTF5myaHHAvEsFLAN4p/BkwlxRcjTo91kcbH0MFuCjh3rCgBjItAS4e+NP8jBW7BN3hhXR4npANt/cDsJdboI3hIT/GulElg+f+tXK3Q7f0jsjh”
}

terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.40.0"
    }
  }
}
Resource “aws_key_pair” "deployer" {
  key_name   = "cep1"
    public_key = " ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDdVNR99Bn6X5pckfQR+JMEyBv2Ox115+Pnbb/5BYGm69qgJfLOxBjFawn7TW54tAdvNXrqpODSr+QWKX3IdR/0czOVTjgXTgHy12IgQhJdO/MS/0Th467lA4QWClntwHPlddwNvKX94DJf3D1cElomhsY2D8l7xsAgMC3PKPUAi7d5+b9b9L5tf/Xx4MnjsONaCdC5rXqGIlCXN2q5pT5aM74OfLV/vGqB4oQ88Z0j6UrFl8CKc2KJsPR12QEdOBDnqhUMiVLuW3QfTmQxS1b4qHhxGUugAkzrxh/TErI8Lz9TI0xa/JVcgniAIK6QUBhXXY0xE/UcxQcI7KhFUQEaE7t5Gk5pf/rgM3jgdS929wIsbG5k37bq+sikbuSNcmoqZ+oMSziPvgVxGoUqapXQExhAZiIZgDlGuwASzZ0ppDOIVHfeEewsEQY78PHLeF1qVclMlVaapIeBBBocvGw0YQw6J2yosmfbQMgv32yhcEAm11B6XGF+URtKhNHEgq0= mohieddinekhale@ip-172-31-25-28”
}
resource "aws_security_group" "sg" {
  name        = "sgcep1"
  description = "Allow All Traffic"
  ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

resource "aws_instance" "web" {
  ami           = "ami-08c40ec9ead489470"
  instance_type = "t2.micro"
  tags = {
    Name = "CEP1"
  }
  key_name = "cep1"
  security_groups = ["sgcep1"]
}

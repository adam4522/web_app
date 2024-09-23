resource "aws_instance" "ansible_instance" {
    ami = "ami-06c68f701d8090592"
    instance_type = "t2.micro"
    subnet_id = aws_subnet.vpc_a_subnet_public_AZ1.id
    vpc_security_group_ids = [aws_security_group.vpc_a_public_instance_sg.id]
    iam_instance_profile = "CWAgent_ssm_role"
    key_name = "linux_key_pair"
    tags = {
    Name = "my_web_app"
    OS = "linux"
  }
} 

#security group for vpc a public instances
resource "aws_security_group" "vpc_a_public_instance_sg" {
  name        = "vpc_a_public_instance_sg"
  description = "vpc_a_public_instance_sg"
  vpc_id      = aws_vpc.vpc_a.id

ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
}

egress {
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]
}

tags = {
    Name = "my_web_app"
  }
}
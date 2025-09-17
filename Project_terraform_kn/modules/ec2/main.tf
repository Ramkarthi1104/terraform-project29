resource "aws_security_group" "ec2_sg" {
  vpc_id      = var.vpc_id
  name        = "project29-sg"
  description = "Allow SSH & HTTP"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "web" {
  ami                         = "ami-0c7217cdde317cfec" # Amazon Linux 2 (us-east-1)
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [aws_security_group.ec2_sg.id]

  tags = { Name = "project29-ec2" }
}

output "public_ip" {
  value = aws_instance.web.public_ip
}

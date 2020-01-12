#1. SG for micro EC2
resource "aws_security_group" "sg_test" {
  name        = "sg-${var.env}"
  vpc_id      = "${var.vpc_id_test}"
  description = "Allow all"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name  = "sg-ec2-${var.env}"
    Type  = "test"
    Stage = "${var.env}"
  }

  lifecycle {
    create_before_destroy = true
  }
}
